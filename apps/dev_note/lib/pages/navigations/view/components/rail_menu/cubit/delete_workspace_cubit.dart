import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'delete_workspace_state.dart';

class DeleteWorkspaceCubit extends Cubit<DeleteWorkspaceState> {
  DeleteWorkspaceCubit({
    required this.workspacesRepository,
  }) : super(DeleteWorkspaceInitial());

  final WorkspacesRepository workspacesRepository;

  Future<void> deleteWorkspace(String workspaceId) async {
    emit(DeleteWorkspaceLoading());
    try {
      await workspacesRepository.deleteWorkspace(workspaceId);
      emit(DeleteWorkspaceSuccess());
    } on ApiException catch (e, s) {
      Logger.error('DeleteWorkspaceCubit.deleteWorkspace', err: e, stackTrace: s);
      emit(DeleteWorkspaceFailure(e));
    } catch (e, s) {
      Logger.error('DeleteWorkspaceCubit.deleteWorkspace', err: e, stackTrace: s);
      emit(DeleteWorkspaceFailure(Exception('Unexpected error\n $e $s')));
    }
  }
}
