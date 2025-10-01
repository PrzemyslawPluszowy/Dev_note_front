import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/add_board_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/add_project_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/delete_project_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/delete_works_pace_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/edit_project_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/edit_workspace_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Hierarchical, reorderable list of Workspaces → Projects → Boards.
///
/// This widget renders three nested reorderable lists with lightweight
/// expansion state kept locally for UX responsiveness. It uses small, focused
/// sub-widgets for readability and performance.
class Workspaces extends StatelessWidget {
  const Workspaces({super.key});

  @override
  Widget build(BuildContext context) {
    // No side-effects are handled here, so BlocBuilder is sufficient.
    return BlocBuilder<WorkspacesMenuCubit, WorkspacesMenuState>(
      builder: (context, state) {
        final workspaces = switch (state) {
          WorkspacesMenuSuccess(:final workspaces) => workspaces,
          WorkspacesMenuLoading(:final oldStateWorkspaces) => oldStateWorkspaces,
          _ => null,
        };
        final isShowingHidden = switch (state) {
          WorkspacesMenuSuccess(:final isShowingHidden) => isShowingHidden,
          _ => false,
        };

        // Determine if everything is hidden. Only true when we have workspaces
        // and for every workspace the workspace itself is hidden and all of its
        // projects are hidden as well. Treat `null` isHide as false (not hidden).
        final isAllHidden =
            workspaces != null &&
            workspaces.isNotEmpty &&
            workspaces.every((workspace) {
              final wsHidden = workspace.isHide ?? false;

              return wsHidden;
            });

        if (workspaces != null) {
          if (workspaces.isEmpty) {
            return Center(
              child: Text(
                LocaleKeys.workspace_createFirstWorkspace.tr(),
                style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            );
          }
          if (isAllHidden && (!isShowingHidden)) {
            return Center(
              child: Text(
                LocaleKeys.messages_noVisibleWorkspaces.tr(),
                style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            );
          }
          return ReorderableListView.builder(
            key: const ValueKey('workspaces_list'),
            buildDefaultDragHandles: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: workspaces.length,
            onReorder: (oldIndex, newIndex) {
              context.read<WorkspacesMenuCubit>().reorderWorkspaces(oldIndex: oldIndex, newIndex: newIndex);
            },
            proxyDecorator: (child, index, animation) {
              return child; // keep default look while dragging
            },
            itemBuilder: (context, index) {
              final workspace = workspaces[index];

              if ((workspace.isHide ?? false) && (!isShowingHidden)) {
                return SizedBox(key: ValueKey('workspace_placeholder_${workspace.id}'));
              } else {
                return ReorderableDragStartListener(
                  index: index,
                  key: ValueKey('workspace_${workspace.id}'),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: Sizes.p2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                      side: BorderSide(color: context.colorScheme.outlineVariant.withAlpha(60)),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        visualDensity: VisualDensity.compact,
                        initiallyExpanded: workspace.isExpanded ?? false,
                        onExpansionChanged: (isExpanded) {
                          context.read<WorkspacesMenuCubit>().toggleWorkspaceExpansion(
                            workspaceId: workspace.id,
                            isExpanded: isExpanded,
                          );
                        },
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: Sizes.p8,
                        ),
                        leading: CircleAvatar(
                          radius: 12,
                          backgroundColor: workspace.primaryColor.toFlutterColor(),
                          child: Icon(workspace.icon.icon, size: Sizes.p12, color: Colors.white),
                        ),
                        title: Tooltip(
                          constraints: const BoxConstraints(maxWidth: 150),
                          message: LocaleKeys.messages_tooltipWorkspace.tr(
                            namedArgs: {
                              'name': workspace.name,
                              'desc': workspace.description ?? LocaleKeys.messages_noDescription.tr(),
                            },
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.onSurfaceVariant.withAlpha(230),
                            borderRadius: BorderRadius.circular(Sizes.p4),
                          ),
                          child: Row(
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
                        ),
                        childrenPadding: const EdgeInsets.fromLTRB(Sizes.p12, 0, Sizes.p12, 0),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _SectionLabel(label: LocaleKeys.labels_projects.tr()),
                              CustomPopup(
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
                          _ProjectsList(
                            isShowingHidden: isShowingHidden,
                            workspace: workspace,
                            onReorderProjects: (oldIndex, newIndex) {
                              context.read<WorkspacesMenuCubit>().reorderProjects(
                                workspaceId: workspace.id,
                                oldIndex: oldIndex,
                                newIndex: newIndex,
                              );
                            },
                            onReorderBoards: (projectId, oldIndex, newIndex) {
                              context.read<WorkspacesMenuCubit>().reorderBoards(
                                workspaceId: workspace.id,
                                projectId: projectId,
                                oldIndex: oldIndex,
                                newIndex: newIndex,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _ProjectsList extends StatelessWidget {
  const _ProjectsList({
    required this.workspace,
    required this.onReorderProjects,
    required this.onReorderBoards,
    required this.isShowingHidden,
  });

  final WorkspacesModel workspace;
  final bool isShowingHidden;
  final void Function(int oldIndex, int newIndex) onReorderProjects;
  final void Function(String projectId, int oldIndex, int newIndex) onReorderBoards;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      buildDefaultDragHandles: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workspace.projects.length,
      onReorder: onReorderProjects,
      proxyDecorator: (child, index, animation) => child,
      itemBuilder: (context, index) {
        final project = workspace.projects[index];
        if ((project.isHide ?? false) && (!isShowingHidden)) {
          return SizedBox(key: ValueKey('project_placeholder_${project.id}'));
        }
        return ReorderableDragStartListener(
          index: index,
          key: ValueKey('project_${project.id}'),
          child: Padding(
            padding: EdgeInsets.zero,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                dense: true,
                initiallyExpanded: project.isExpanded ?? false,
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
                title: Tooltip(
                  constraints: const BoxConstraints(maxWidth: 200),
                  message: LocaleKeys.messages_tooltipProject.tr(
                    namedArgs: {
                      'name': project.name,
                      'desc': project.description ?? LocaleKeys.messages_noDescription.tr(),
                    },
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurfaceVariant.withAlpha(230),
                    borderRadius: BorderRadius.circular(Sizes.p4),
                  ),
                  child: Row(
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
                ),
                childrenPadding: const EdgeInsets.only(left: Sizes.p8),
                children: [
                  Row(
                    children: [
                      _SectionLabel(label: LocaleKeys.labels_boards.tr()),
                      const Spacer(),
                      CustomPopup(
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
                  _BoardsList(
                    isShowingHidden: isShowingHidden,
                    project: project,
                    onReorder: (oldIndex, newIndex) => onReorderBoards(project.id, oldIndex, newIndex),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BoardsList extends StatelessWidget {
  const _BoardsList({
    required this.project,
    required this.onReorder,
    required this.isShowingHidden,
  });

  final ProjectModel project;
  final void Function(int oldIndex, int newIndex) onReorder;
  final bool isShowingHidden;

  @override
  Widget build(BuildContext context) {
    if (project.boards.isEmpty) {
      return const SizedBox.shrink();
    }
    if ((project.isHide ?? false) && (!isShowingHidden)) {
      return const SizedBox.shrink();
    }

    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: project.boards.length,
      onReorder: onReorder,
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
            child: Tooltip(
              constraints: const BoxConstraints(maxWidth: 200),
              decoration: BoxDecoration(
                color: context.colorScheme.onSurfaceVariant.withAlpha(230),
                borderRadius: BorderRadius.circular(Sizes.p4),
              ),
              message: LocaleKeys.messages_tooltipBoard.tr(
                namedArgs: {
                  'name': board.name,
                  'desc': board.description ?? LocaleKeys.messages_noDescription.tr(),
                },
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: CircleAvatar(
                  radius: 10,
                  backgroundColor: context.colorScheme.primary,
                  child: Icon(PhosphorIcons.database(), size: Sizes.p12, color: Colors.white),
                ),
                title: Text(
                  board.name,
                  style: context.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  onPressed: () async {
                    context.read<WorkspacesMenuCubit>().toggleBoardVisibility(
                      workspaceId: project.workspaceId,
                      projectId: project.id,
                      boardId: board.id,
                      isHide: !(board.isHide ?? false),
                    );
                  },
                  icon: AnimatedSwitcher(
                    duration: 200.ms,
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: (board.isHide ?? false)
                        ? Icon(
                            key: const ValueKey('eye_icon'),
                            PhosphorIcons.eye(),
                            size: Sizes.p16,
                            color: context.colorScheme.outline,
                          )
                        : Icon(
                            key: const ValueKey('eye_slash_icon'),
                            PhosphorIcons.eyeSlash(),
                            size: Sizes.p16,
                            color: context.colorScheme.outline,
                          ),
                  ),
                ),
                onTap: () {
                  // TODO(dev-note): Handle board selection via navigation/cubit.
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// Previous custom widgets (_ExpandableNode, _GradientIconBadge) were removed in favor of Material widgets.

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.outline,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
