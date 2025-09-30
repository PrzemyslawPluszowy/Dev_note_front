import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'edit_project_state.dart';

class EditProjectCubit extends Cubit<EditProjectState> {
  EditProjectCubit({required this.projectsRepository}) : super(EditProjectInitial());

  final ProjectsRepository projectsRepository;

  Future<void> editProject({
    required String projectId,
    required String workspaceId,
    required String name,
    String? description,
    ApiPhosphorIcons? icon,
    ApiColorScheme? primaryColor,
  }) async {
    emit(EditProjectLoading());
    try {
      await projectsRepository.editProject(
        projectId: projectId,
        workspaceId: workspaceId,
        createWorkspaceModel: EditProjectRequest(
          name: name,
          description: description,
          icon: icon,
          primaryColor: primaryColor,
        ),
      );

      emit(EditProjectSuccess());
    } on ApiException catch (e, s) {
      Logger.error('EditProjectCubit.editProject', err: e, stackTrace: s);
      emit(EditProjectFailure(e));
    } catch (e, s) {
      Logger.error('EditProjectCubit.editProject', err: e, stackTrace: s);
      emit(EditProjectFailure(Exception('Unexpected error\n $e $s')));
    }
  }
}
