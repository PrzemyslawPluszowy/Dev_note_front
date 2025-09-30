import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'edit_workspace_state.dart';

class EditWorkspaceCubit extends Cubit<EditWorkspaceState> {
  EditWorkspaceCubit(this.workspacesRepository) : super(EditWorkspaceInitial());

  final WorkspacesRepository workspacesRepository;

  Future<void> editWorkspace({
    required String workspaceId,
    required String name,
    String? description,
    ApiPhosphorIcons? icon,
    ApiColorScheme? primaryColor,
  }) async {
    emit(EditWorkspaceLoading());
    try {
      await workspacesRepository.editWorkspace(
        workspaceId,
        CreateWorkspaceModel(
          name: name,
          description: description,
          icon: icon,
          primaryColor: primaryColor,
        ),
      );

      emit(EditWorkspaceSuccess());
    } on ApiException catch (e, s) {
      Logger.error('EditWorkspaceCubit.editWorkspace', err: e, stackTrace: s);
      emit(EditWorkspaceFailure(e));
    } catch (e, s) {
      Logger.error('EditWorkspaceCubit.editWorkspace', err: e, stackTrace: s);
      emit(EditWorkspaceFailure(Exception('Unexpected error\n $e $s')));
    }
  }
}
