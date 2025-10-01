import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/home/view/components/header/main_header_widget.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/rail_container.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/rail_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

@RoutePage(name: 'rail_navigation')
class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkspacesMenuCubit(
        menuHiddenMenuHiveRepository: getIt<MenuHiddenMenuHiveRepository>(),
        workspacesRepository: getIt<WorkspacesRepository>(),
        reorderableHiveRepository: getIt<ReorderableHiveRepository>(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(
            top: Sizes.p32,
            left: Sizes.p8,
            bottom: Sizes.p8,
            right: Sizes.p8,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 1],
              colors: [
                context.colorScheme.surface.withValues(alpha: 0.3),
                context.colorScheme.surface.withValues(alpha: 0.1),
              ],
            ),
          ),
          child: Row(
            children: [
              const RailContainer(
                child: SingleChildScrollView(
                  child: RailMenuWidget(),
                ),
              ).animate().slideX(duration: 500.ms).fadeIn(duration: 500.ms),
              Expanded(
                child: Column(
                  children: [
                    const MainHeaderWidget().animate().slideY(duration: 500.ms).fadeIn(duration: 500.ms),
                    const MainScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: context.colorScheme.primary.withAlpha(190),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Sizes.p8),
              bottomRight: Radius.circular(Sizes.p8),
            ),
            color: context.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.shadow.withValues(alpha: .3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ).animate().slideY(duration: 500.ms, begin: 0.3, end: 0).fadeIn(duration: 500.ms),
      ),
    );
  }
}
