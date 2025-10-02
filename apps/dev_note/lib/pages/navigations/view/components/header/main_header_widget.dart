import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_utils/p_utils.dart';

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Sizes.p16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(Sizes.p8),
            ),
            color: context.colorScheme.primary.withAlpha(190),
          ),
          child: Row(
            children: [
              Text(
                'Welcome to DevNote',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              //TODO przerobic na blok do ładowania globany
              BlocBuilder<WorkspacesMenuCubit, WorkspacesMenuState>(
                builder: (context, state) {
                  if (state case WorkspacesMenuLoading()) {
                    return SizedBox(
                      width: Sizes.p20,
                      height: Sizes.p20,
                      child: CircularProgressIndicator(
                        color: context.colorScheme.onPrimary,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomRight,
              colors: [
                context.colorScheme.primary.withAlpha(190),
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
          padding: const EdgeInsets.all(Sizes.p2),
        ),
      ],
    );
  }
}
