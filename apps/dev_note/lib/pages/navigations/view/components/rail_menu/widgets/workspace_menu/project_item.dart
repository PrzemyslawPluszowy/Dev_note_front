import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/notifier/active_board_notifier.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/add_board_dialog.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/delete_project_dialog.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/edit_project_dialog.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/workspace_menu/board_item.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/workspace_menu/section_label.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Single project item with expandable boards list
class ProjectItem extends StatelessWidget {
  const ProjectItem({
    required this.project,
    required this.workspace,
    required this.isShowingHidden,
    super.key,
  });

  final ProjectModel project;
  final WorkspacesModel workspace;
  final bool isShowingHidden;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ActiveBoardNotifier.instance,
      builder: (context, child) {
        // Check if this project contains the active board
        final activeBoardId = ActiveBoardNotifier.instance.activeBoardId;
        final hasActiveBoard = activeBoardId != null && project.boards.any((board) => board.id == activeBoardId);

        // Use a blended, fully-opaque color for project container so it's
        // visually lighter than primaryContainer but without transparency
        // (avoids drag/drop visual artifacts). Blend towards surface for subtlety.
        final projectBg =
            Color.lerp(context.colorScheme.primaryContainer, context.colorScheme.surface, 0.85) ??
            context.colorScheme.primaryContainer;
        return Padding(
          padding: EdgeInsets.zero,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              key: ValueKey('project_expansion_${project.id}_$hasActiveBoard'),
              dense: true,
              initiallyExpanded: hasActiveBoard || (project.isExpanded ?? false),
              maintainState: true,
              onExpansionChanged: (isExpanded) {
                context.read<WorkspacesMenuCubit>().toggleProjectExpansion(
                  workspaceId: workspace.id,
                  projectId: project.id,
                  isExpanded: isExpanded,
                );
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p8)),
              tilePadding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: project.primaryColor.toFlutterColor(),
                child: PhosphorIcon(project.icon.icon, size: Sizes.p12, color: Colors.white),
              ),
              title: Row(
                children: [
                  Text(
                    project.name,
                    style: context.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  CustomMenuPopup(
                    button: Icon(
                      PhosphorIcons.listPlus(),
                      size: Sizes.p16,
                      color: context.colorScheme.outline,
                    ),
                    menus: [
                      CustomMenuOverlay(
                        title: '${LocaleKeys.common_edit.tr()} ${LocaleKeys.project_title.tr()}',
                        icon: PhosphorIcons.pencil(),
                        noodle: (context, animationStatus, close) => EditProjectDialog(
                          projectModel: project,
                          workspaceId: workspace.id,
                          closeCallback: close,
                        ),
                      ),
                      CustomMenuOverlay(
                        title: project.isHide ?? false
                            ? LocaleKeys.messages_projectUnhideTitle.tr()
                            : LocaleKeys.messages_projectHideTitle.tr(),
                        icon: project.isHide ?? false ? PhosphorIcons.eye() : PhosphorIcons.eyeSlash(),
                        onTap: () {
                          context.read<WorkspacesMenuCubit>().toggleProjectVisibility(
                            workspaceId: workspace.id,
                            projectId: project.id,
                            isHide: !(project.isHide ?? false),
                          );
                        },
                      ),
                      CustomMenuOverlay(
                        title: '${LocaleKeys.common_delete.tr()} ${LocaleKeys.project_title.tr()}',
                        icon: PhosphorIcons.trash(),
                        iconColor: Colors.red,
                        onTap: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<WorkspacesMenuCubit>(),
                                child: DeleteProjectDialog(
                                  workspaceId: workspace.id,
                                  projectId: project.id,
                                  projectName: project.name,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              childrenPadding: const EdgeInsets.only(left: Sizes.p8, right: Sizes.p8, bottom: Sizes.p8),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: projectBg,
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  padding: const EdgeInsets.all(Sizes.p8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SectionLabel(label: LocaleKeys.labels_boards.tr()),
                          const Spacer(),
                          CustomPopupWidget(
                            width: 400,
                            content: (closePopup) => BlocProvider.value(
                              value: context.read<WorkspacesMenuCubit>(),
                              child: AddBoardDialog(
                                closePopup: closePopup,
                                workspaceId: workspace.id,
                                projectId: project.id,
                              ),
                            ),
                            icon: PhosphorIcons.plus(),
                            iconSize: Sizes.p16,
                            iconColor: context.colorScheme.primary,
                            key: ValueKey('add_board_to_${project.id}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: Sizes.p4),
                      if (project.boards.isNotEmpty && !((project.isHide ?? false) && (!isShowingHidden)))
                        ReorderableListView.builder(
                          buildDefaultDragHandles: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: project.boards.length,
                          onReorder: (oldIndex, newIndex) {
                            context.read<WorkspacesMenuCubit>().reorderBoards(
                              workspaceId: workspace.id,
                              projectId: project.id,
                              oldIndex: oldIndex,
                              newIndex: newIndex,
                            );
                          },
                          proxyDecorator: (child, index, animation) => child,
                          itemBuilder: (context, index) {
                            final board = project.boards[index];
                            if ((board.isHide ?? false) && (!isShowingHidden)) {
                              return SizedBox(key: ValueKey('board_placeholder_${board.id}'));
                            }
                            return Material(
                              key: ValueKey('board_${board.id}'),
                              color: Colors.transparent,
                              child: ReorderableDragStartListener(
                                key: ValueKey('board_${board.id}'),
                                index: index,
                                child: BoardItem(
                                  board: board,
                                  project: project,
                                ),
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
