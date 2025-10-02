import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/workspace_menu/workspace_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_utils/p_utils.dart';

/// Hierarchical, reorderable list of Workspaces → Projects → Boards.
///
/// This widget renders three nested reorderable lists with lightweight
/// expansion state kept locally for UX responsiveness. It uses small, focused
/// sub-widgets for readability and performance.
class Workspaces extends StatelessWidget {
  const Workspaces({super.key});

  @override
  Widget build(BuildContext context) {
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
              context.read<WorkspacesMenuCubit>().reorderWorkspaces(
                oldIndex: oldIndex,
                newIndex: newIndex,
              );
            },
            proxyDecorator: (child, index, animation) => child,
            itemBuilder: (context, index) {
              final workspace = workspaces[index];

              if ((workspace.isHide ?? false) && (!isShowingHidden)) {
                return SizedBox(key: ValueKey('workspace_placeholder_${workspace.id}'));
              } else {
                return ReorderableDragStartListener(
                  index: index,
                  key: ValueKey('workspace_${workspace.id}'),
                  child: WorkspaceItem(
                    workspace: workspace,
                    isShowingHidden: isShowingHidden,
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
