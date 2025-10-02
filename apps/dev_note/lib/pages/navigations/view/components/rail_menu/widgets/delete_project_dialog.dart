import 'dart:async';
import 'dart:ui';

import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/shared/widgets/custom_error_widget.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/delete_project_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';

class DeleteProjectDialog extends HookWidget {
  const DeleteProjectDialog({
    required this.workspaceId,
    required this.projectId,
    required this.projectName,
    super.key,
  });

  final String workspaceId;
  final String projectId;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    final deleteProjectCubit = useBloc(
      () => DeleteProjectCubit(projectsRepository: getIt<ProjectsRepository>()),
    );
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        title: Text(LocaleKeys.messages_projectDeleteTitle.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.messages_projectDeleteConfirm.tr(namedArgs: {'name': projectName}),
              style: context.textTheme.bodyLarge,
            ),
            gapH16,
            BlocConsumer<DeleteProjectCubit, DeleteProjectState>(
              bloc: deleteProjectCubit,
              listener: (_, state) {
                if (state is DeleteProjectSuccess) {
                  if (context.mounted) {
                    WebToast.showTop(
                      duration: 2000.ms,
                      toast: ToastData(
                        message: LocaleKeys.messages_projectDeleted.tr(),
                        type: WebToastType.success,
                      ),
                      context: context,
                    );
                    Navigator.of(context).pop();
                    unawaited(context.read<WorkspacesMenuCubit>().fetchWorkspaces(showLoading: false));
                  }
                } else if (state case DeleteProjectFailure(:final error)) {
                  if (context.mounted) {
                    WebToast.showTop(
                      duration: 2000.ms,
                      toast: ToastData(
                        message: error.message,
                        type: WebToastType.error,
                      ),
                      context: context,
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state case DeleteProjectFailure(:final error)) {
                  return CustomErrorWidget(exception: error);
                }
                return const SizedBox.shrink();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(LocaleKeys.common_cancel.tr()),
                ),
                gapW8,
                LoadingButton(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: LocaleKeys.common_delete.tr(),
                  loadingLabel: '${LocaleKeys.common_delete.tr()}...',
                  onPressed: () async {
                    await deleteProjectCubit.deleteProject(
                      workspaceId: workspaceId,
                      projectId: projectId,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
