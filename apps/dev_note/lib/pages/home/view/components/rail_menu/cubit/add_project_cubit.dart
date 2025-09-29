import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit({required this.projectsRepository}) : super(AddProjectInitial());

  final ProjectsRepository projectsRepository;

  Future<void> addProject({
    required String name,
    required String workspaceId,
    String? description,
    ApiPhosphorIcons? icon,
    ApiColorScheme? primaryColor,
  }) async {
    try {
      emit(AddProjectLoading());
      await projectsRepository.createProject(
        CreateProjectRequest(
          name: name,
          workspaceId: workspaceId,
          description: description,
          icon: icon,
          primaryColor: primaryColor,
        ),
      );
      emit(AddProjectSuccess());
    } on ApiException catch (e, s) {
      Logger.error('AddProjectCubit', err: e, stackTrace: s);

      emit(AddProjectFailure(error: e));
    } catch (e, s) {
      Logger.error('AddProjectCubit', err: e, stackTrace: s);
      emit(AddProjectFailure(error: Exception('Wystąpił nieoczekiwany błąd \n $e')));
    }
  }
}
