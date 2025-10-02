import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/notifier/active_board_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Single board item in the boards list
class BoardItem extends StatelessWidget {
  const BoardItem({
    required this.board,
    required this.project,
    super.key,
  });

  final BoardShortModel board;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ActiveBoardNotifier.instance,
      builder: (context, child) {
        final isSelected = ActiveBoardNotifier.instance.isBoardActive(board.id);

        return _ActiveContainerState(
          isSelected: isSelected,
          child: ListTile(
            selected: isSelected,
            selectedColor: context.colorScheme.primary,
            selectedTileColor: context.colorScheme.primaryContainer.withAlpha(50),
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
            onTap: () async {
              // Navigate to the board route
              // Note: ActiveBoardNotifier will be updated automatically by BoardPage.initState()
              await AutoRouter.of(context).navigate(
                Main(
                  child: const AutoRouter(),
                  children: [BoardRoute(boardId: board.id)],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ActiveContainerState extends StatefulWidget {
  const _ActiveContainerState({required this.child, required this.isSelected});

  @override
  State<_ActiveContainerState> createState() => _ActiveContainerStateState();
  final Widget child;
  final bool isSelected;
}

class _ActiveContainerStateState extends State<_ActiveContainerState> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    if (widget.isSelected) {
      unawaited(_controller.repeat());
    }
  }

  @override
  void didUpdateWidget(_ActiveContainerState oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Start/stop animation based on selection state
    if (widget.isSelected && !oldWidget.isSelected) {
      unawaited(_controller.repeat());
    } else if (!widget.isSelected && oldWidget.isSelected) {
      _controller
        ..stop()
        ..reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p4),
            border: widget.isSelected
                ? GradientBoxBorder(
                    gradient: LinearGradient(
                      transform: GradientRotation(_controller.value * 2 * 3.14159),
                      colors: const [
                        Colors.purple,
                        Colors.blue,
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  )
                : null,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
