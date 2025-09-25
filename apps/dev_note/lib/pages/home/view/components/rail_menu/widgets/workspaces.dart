import 'package:dev_note/pages/home/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

    return BlocConsumer<WorkspacesMenuCubit, WorkspacesMenuState>(
      listener: (context, state) {},
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
              return child; // Hide drag handles by returning child without decoration
            },
            itemBuilder: (context, index) {
              final workspace = workspaces[index];
              return ReorderableDragStartListener(
                index: index,
                key: ValueKey('workspace_${workspace.id}'),
                child: _ExpandableNode(
                  key: ValueKey('workspace_${workspace.id}'),
                  id: 'ws:${workspace.id}',
                  leading: Container(
                    padding: const EdgeInsets.all(Sizes.p2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          workspace.primaryColor.toFlutterColor(),
                          workspace.primaryColor.toFlutterColor().withAlpha(150),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(Sizes.p2),
                    ),
                    child: PhosphorIcon(workspace.icon.icon, size: Sizes.p20, color: Colors.white),
                  ),
                  title: Text(
                    workspace.name,
                    style: context.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: isExpanded('ws:${workspace.id}'),
                  onToggle: () => toggleExpanded('ws:${workspace.id}'),
                  children: [
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
      proxyDecorator: (child, index, animation) => Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(Sizes.p8),
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.outline),
            borderRadius: BorderRadius.circular(Sizes.p4),
          ),
          child: child,
        ), // Hide drag handles by returning child without decoration
      ),

      itemBuilder: (context, index) {
        final project = workspace.projects[index];
        return ReorderableDragStartListener(
          index: index,
          key: ValueKey('project_${project.id}'),
          child: _ExpandableNode(
            id: 'pr:${project.id}',
            leading: Container(
              padding: const EdgeInsets.all(Sizes.p2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    workspace.primaryColor.toFlutterColor(),
                    workspace.primaryColor.toFlutterColor().withAlpha(180),
                  ],
                ),
                borderRadius: BorderRadius.circular(Sizes.p2),
              ),
              child: PhosphorIcon(project.icon.icon, size: Sizes.p20, color: Colors.white),
            ),
            title: Text(
              project.name,
              style: context.textTheme.bodyLarge,
            ),
            expanded: expandedSet.contains('pr:${project.id}'),
            onToggle: () => toggleExpanded('pr:${project.id}'),
            children: [
              _BoardsList(
                project: project,
                onReorder: (oldIndex, newIndex) => onReorderBoards(project.id, oldIndex, newIndex),
              ),
            ],
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
      proxyDecorator: (child, index, animation) {
        return child; // Hide drag handles by returning child without decoration
      },
      itemBuilder: (context, index) {
        final board = project.boards[index];
        return ReorderableDragStartListener(
          key: ValueKey('board_${board.id}'),
          index: index,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Handle board selection
              },
              borderRadius: BorderRadius.circular(Sizes.p4),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.colorScheme.surface.withValues(alpha: 0.9),
                      context.colorScheme.surface.withValues(alpha: 0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(Sizes.p4),
                ),
                child: Row(
                  children: [
                    // Board icon with colored background
                    Container(
                      padding: const EdgeInsets.all(Sizes.p2),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            context.colorScheme.primary,
                            context.colorScheme.primary.withAlpha(180),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(Sizes.p2),
                      ),
                      child: PhosphorIcon(
                        PhosphorIcons.database(),
                        size: Sizes.p20,
                        color: Colors.white,
                      ),
                    ),
                    gapW12,
                    // Board name
                    Expanded(
                      child: Text(board.name, style: context.textTheme.bodyLarge),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ExpandableNode extends StatelessWidget {
  const _ExpandableNode({
    required this.id,
    required this.leading,
    required this.title,
    required this.expanded,
    required this.onToggle,
    super.key,
    this.children = const <Widget>[],
  });

  final String id;
  final Widget leading;
  final Widget title;
  final bool expanded;
  final VoidCallback onToggle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(Sizes.p4),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colorScheme.surface.withValues(alpha: 0.9),
                    context.colorScheme.surface.withValues(alpha: 0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(Sizes.p4),
              ),
              child: Row(
                children: [
                  // Expansion arrow
                  AnimatedRotation(
                    turns: expanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.chevron_right, size: 16, color: context.colorScheme.primary),
                  ),
                  gapW4,
                  // Leading icon
                  leading,
                  gapW4,
                  // Title
                  Expanded(child: title),
                ],
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(left: Sizes.p16, top: Sizes.p4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
          crossFadeState: expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
          sizeCurve: Curves.easeInOut,
        ),
        gapH8,
      ],
    );
  }
}
