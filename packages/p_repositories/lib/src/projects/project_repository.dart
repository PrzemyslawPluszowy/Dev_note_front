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
}
