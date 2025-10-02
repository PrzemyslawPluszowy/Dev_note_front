import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/notifier/active_board_notifier.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/add_project_dialog.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/delete_works_pace_dialog.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/edit_workspace_widget.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/workspace_menu/project_item.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/workspace_menu/section_label.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Single workspace item in the menu with expandable projects list
class WorkspaceItem extends StatelessWidget {
  const WorkspaceItem({
    required this.workspace,
    required this.isShowingHidden,
    super.key,
  });

  final WorkspacesModel workspace;
  final bool isShowingHidden;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ActiveBoardNotifier.instance,
      builder: (context, child) {
        // Check if this workspace contains the active board
        final activeBoardId = ActiveBoardNotifier.instance.activeBoardId;
        final hasActiveBoard =
            activeBoardId != null &&
            workspace.projects.any((project) => project.boards.any((board) => board.id == activeBoardId));

        return Card(
          margin: const EdgeInsets.symmetric(vertical: Sizes.p2),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
            side: BorderSide(color: context.colorScheme.outlineVariant.withAlpha(60)),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              key: ValueKey('workspace_expansion_${workspace.id}_$hasActiveBoard'),
              visualDensity: VisualDensity.compact,
              initiallyExpanded: hasActiveBoard || (workspace.isExpanded ?? false),
              maintainState: true,
              onExpansionChanged: (isExpanded) {
                context.read<WorkspacesMenuCubit>().toggleWorkspaceExpansion(
                  workspaceId: workspace.id,
                  isExpanded: isExpanded,
                );
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: workspace.primaryColor.toFlutterColor(),
                child: Icon(workspace.icon.icon, size: Sizes.p12, color: Colors.white),
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      workspace.name,
                      style: context.textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomMenuPopup(
                    button: Icon(
                      PhosphorIcons.listPlus(),
                      size: Sizes.p16,
                      color: context.colorScheme.outline,
                    ),
                    menus: [
                      CustomMenuOverlay(
                        title: '${LocaleKeys.common_edit.tr()} ${LocaleKeys.workspace_title.tr()}',
                        icon: PhosphorIcons.pencil(),
                        noodle: (context, animationStatus, close) =>
                            EditWorkspaceWidget(workspace: workspace, closeCallback: close),
                      ),
                      CustomMenuOverlay(
                        title: LocaleKeys.messages_workspaceDeleteTitle.tr(),
                        icon: PhosphorIcons.trash(),
                        iconColor: Colors.red,
                        onTap: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<WorkspacesMenuCubit>(),
                                child: DeleteWorksPaceDialog(workspace: workspace),
                              );
                            },
                          );
                        },
                      ),
                      CustomMenuOverlay(
                        title: (workspace.isHide ?? false)
                            ? LocaleKeys.messages_workspaceUnhideTitle.tr()
                            : LocaleKeys.messages_workspaceHideTitle.tr(),
                        icon: (workspace.isHide ?? false) ? PhosphorIcons.eye() : PhosphorIcons.eyeSlash(),
                        onTap: () {
                          context.read<WorkspacesMenuCubit>().toggleWorkspaceVisibility(
                            workspaceId: workspace.id,
                            isHide: !(workspace.isHide ?? false),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              childrenPadding: const EdgeInsets.fromLTRB(Sizes.p12, 0, Sizes.p12, Sizes.p8),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  padding: const EdgeInsets.all(Sizes.p8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionLabel(label: LocaleKeys.labels_projects.tr()),
                          CustomPopupWidget(
                            key: ValueKey('add_project_to_${workspace.id}'),
                            width: 500,
                            content: (closePopup) {
                              return BlocProvider.value(
                                value: context.read<WorkspacesMenuCubit>(),
                                child: AddProjectDialog(closePopup: closePopup, workspaceId: workspace.id),
                              );
                            },
                            icon: PhosphorIcons.plus(),
                            iconSize: Sizes.p20,
                            iconColor: context.colorScheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: Sizes.p4),
                      ReorderableListView.builder(
                        shrinkWrap: true,
                        buildDefaultDragHandles: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: workspace.projects.length,
                        onReorder: (oldIndex, newIndex) {
                          context.read<WorkspacesMenuCubit>().reorderProjects(
                            workspaceId: workspace.id,
                            oldIndex: oldIndex,
                            newIndex: newIndex,
                          );
                        },
                        proxyDecorator: (child, index, animation) => child,
                        itemBuilder: (context, index) {
                          final project = workspace.projects[index];
                          if ((project.isHide ?? false) && (!isShowingHidden)) {
                            return SizedBox(key: ValueKey('project_placeholder_${project.id}'));
                          }
                          return ReorderableDragStartListener(
                            index: index,
                            key: ValueKey('project_${project.id}'),
                            child: ProjectItem(
                              project: project,
                              workspace: workspace,
                              isShowingHidden: isShowingHidden,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
