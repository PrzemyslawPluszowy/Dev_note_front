import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/add_work_space_dialog.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/widgets/workspaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RailMenuWidget extends StatelessWidget {
  const RailMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _RailHeader(),
        gapH24,
        //Przycisk do dodania workspace'a i odświeżenia
        _WorkspacesLabel(),
        //List of workspaces
        Workspaces(),
      ],
    );
  }
}

class _WorkspacesLabel extends StatelessWidget {
  const _WorkspacesLabel();

  @override
  Widget build(BuildContext context) {
    final addButtonKey = GlobalKey();

    return Row(
      children: [
        const Icon(
          Icons.workspaces_outline,
          size: 16,
          color: Colors.white,
        ),
        gapW12,
        // Label "Workspaces"
        Expanded(
          child: Text(
            'Workspaces',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ).animate().fadeIn(duration: 500.ms).moveX(duration: 500.ms, begin: -120, end: 0),
        BlocBuilder<WorkspacesMenuCubit, WorkspacesMenuState>(
          builder: (context, state) {
            if (state case WorkspacesMenuSuccess(:final isShowingHidden)) {
              return AnimatedSwitcher(
                duration: 500.ms,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: isShowingHidden
                    ? IconButton(
                        key: const ValueKey('hide'),
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await context.read<WorkspacesMenuCubit>().toggleHiddenMenu();
                        },
                        icon: PhosphorIcon(
                          PhosphorIcons.eyeSlash(),
                          size: Sizes.p16,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        key: const ValueKey('show'),
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await context.read<WorkspacesMenuCubit>().toggleHiddenMenu();
                        },
                        icon: PhosphorIcon(
                          PhosphorIcons.eye(),
                          size: Sizes.p16,
                          color: Colors.white,
                        ),
                      ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        gapW8,

        // Dodaj workspace
        CustomPopupWidget(
          width: 500,

          content: (closePopup) => BlocProvider.value(
            value: context.read<WorkspacesMenuCubit>(),
            child: AddWorkSpaceDialog(closePopup: closePopup),
          ),
          icon: PhosphorIcons.plus(),
          iconSize: Sizes.p16,
          iconColor: Colors.white,
          key: addButtonKey,
        ),
        gapW8,
        // Przycisk do odświeżenia
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            await context.read<WorkspacesMenuCubit>().fetchWorkspaces(showLoading: true);
          },
          icon: PhosphorIcon(
            PhosphorIcons.arrowClockwise(),
            size: Sizes.p16,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 500.ms),
      ],
    );
  }
}

class _RailHeader extends StatelessWidget {
  const _RailHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p8),
      child: Row(
        children: [
          const Icon(
            Icons.code,
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'DevNote',
              style: context.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
