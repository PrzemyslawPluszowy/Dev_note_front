import 'package:dio/dio.dart';
import 'package:p_models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'project_repository.g.dart';

/// Operacje na workspace'ach
@RestApi()
/// Operacje na projektach
abstract class ProjectsRepository {
  factory ProjectsRepository(Dio dio) = _ProjectsRepository;

  /// Pobranie informacji o workspace'ach
  @POST('/projects')
  Future<ProjectModel> createProject(
    @Body() CreateProjectRequest createProjectRequest,
  );

  @PATCH('/projects/editProject/{projectId}/workspace/{workspaceId}')
  Future<void> editProject({
    @Path('workspaceId') required String workspaceId,
    @Path('projectId') required String projectId,
    @Body() required EditProjectRequest createWorkspaceModel,
  });

  /// Usunięcie workspace'a z projektami
  @DELETE('/projects/{projectId}/workspace/{workspaceId}')
  Future<MessageResponse> deleteProject({
    @Path('workspaceId') required String workspaceId,
    @Path('projectId') required String projectId,
  });
}
