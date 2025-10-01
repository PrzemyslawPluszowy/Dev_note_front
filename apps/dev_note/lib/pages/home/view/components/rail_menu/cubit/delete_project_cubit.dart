import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'delete_project_state.dart';

class DeleteProjectCubit extends Cubit<DeleteProjectState> {
  DeleteProjectCubit({required this.projectsRepository}) : super(DeleteProjectInitial());

  final ProjectsRepository projectsRepository;

  Future<void> deleteProject({required String projectId, required String workspaceId}) async {
    emit(DeleteProjectLoading());
    try {
      await projectsRepository.deleteProject(projectId: projectId, workspaceId: workspaceId);
      emit(DeleteProjectSuccess());
    } on ApiException catch (e, s) {
      Logger.error('DeleteProjectCubit.deleteProject', err: e, stackTrace: s);
      emit(DeleteProjectFailure(error: e));
    } catch (e, s) {
      Logger.error('DeleteProjectCubit.deleteProject', err: e, stackTrace: s);
      emit(DeleteProjectFailure(error: Exception('Unexpected error\n $e $s')));
    }
  }
}
