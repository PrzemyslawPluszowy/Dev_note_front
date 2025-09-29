import 'package:dev_note/pages/home/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/add_board_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/add_project_dialog.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/widgets/edit_workspace_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Hierarchical, reorderable list of Workspaces → Projects → Boards.
///
/// This widget renders three nested reorderable lists with lightweight
/// expansion state kept locally for UX responsiveness. It uses small, focused
/// sub-widgets for readability and performance.
class Workspaces extends HookWidget {
  const Workspaces({super.key});

  @override
  Widget build(BuildContext context) {
    // Track expanded nodes by id (prefix with type to avoid clashes)
    final expanded = useState<Set<String>>(<String>{});
    bool isExpanded(String id) => expanded.value.contains(id);
    void toggleExpanded(String id) {
      final set = Set<String>.from(expanded.value);
      if (set.contains(id)) {
        set.remove(id);
      } else {
        set.add(id);
      }
      expanded.value = set;
    }

    // No side-effects are handled here, so BlocBuilder is sufficient.
    return BlocBuilder<WorkspacesMenuCubit, WorkspacesMenuState>(
      builder: (context, state) {
        final workspaces = switch (state) {
          WorkspacesMenuSuccess(:final workspaces) => workspaces,
          WorkspacesMenuLoading(:final oldStateWorkspaces) => oldStateWorkspaces,
          _ => null,
        };
        if (workspaces != null) {
          return ReorderableListView.builder(
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
                      initiallyExpanded: isExpanded('ws:${workspace.id}'),
                      onExpansionChanged: (_) => toggleExpanded('ws:${workspace.id}'),
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.p8,
                      ),
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
                            menus: [
                              CustomMenuOverlay(
                                title: 'Edytuj workspace',
                                icon: PhosphorIcons.pencil(),
                                noodle: (context, animationStatus, close) => EditWorkspaceWidget(workspace: workspace),
                              ),
                              CustomMenuOverlay(
                                title: 'Usuń workspace',
                                icon: PhosphorIcons.trash(),
                                iconColor: Colors.red,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Usuń workspace'),
                                        content: Text(
                                          'Czy na pewno chcesz usunąć workspace "${workspace.name}"? '
                                          'Operacji tej nie można cofnąć.',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: const Text('Anuluj'),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Usuń'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(Sizes.p12, 0, Sizes.p12, 0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _SectionLabel(label: 'Projekty'),
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
                          workspace: workspace,
                          expandedSet: expanded.value,
                          toggleExpanded: toggleExpanded,
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
    required this.expandedSet,
    required this.toggleExpanded,
  });

  final WorkspacesModel workspace;
  final void Function(int oldIndex, int newIndex) onReorderProjects;
  final void Function(String projectId, int oldIndex, int newIndex) onReorderBoards;
  final Set<String> expandedSet;
  final void Function(String id) toggleExpanded;

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
        return ReorderableDragStartListener(
          index: index,
          key: ValueKey('project_${project.id}'),
          child: Padding(
            padding: EdgeInsets.zero,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                dense: true,
                initiallyExpanded: expandedSet.contains('pr:${project.id}'),
                onExpansionChanged: (_) => toggleExpanded('pr:${project.id}'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p8)),
                tilePadding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                leading: CircleAvatar(
                  radius: 10,
                  backgroundColor: project.primaryColor.toFlutterColor(),
                  child: PhosphorIcon(project.icon.icon, size: Sizes.p12, color: Colors.white),
                ),
                title: Text(
                  project.name,
                  style: context.textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                childrenPadding: const EdgeInsets.only(left: Sizes.p8),
                children: [
                  Row(
                    children: [
                      const _SectionLabel(label: 'Boardy'),
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
  });

  final ProjectModel project;
  final void Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    if (project.boards.isEmpty) {
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
        return Material(
          key: ValueKey('board_${board.id}'),
          color: Colors.transparent,
          child: ReorderableDragStartListener(
            key: ValueKey('board_${board.id}'),
            index: index,
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
              onTap: () {
                // TODO(dev-note): Handle board selection via navigation/cubit.
              },
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
