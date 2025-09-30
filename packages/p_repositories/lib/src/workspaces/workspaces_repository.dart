import 'package:dio/dio.dart';
import 'package:p_models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'workspaces_repository.g.dart';

/// Operacje na workspace'ach
@RestApi()
/// Operacje na workspace'ach
abstract class WorkspacesRepository {
  factory WorkspacesRepository(Dio dio) = _WorkspacesRepository;

  /// Pobranie informacji o workspace'ach
  @GET('/workspaces/workspaces')
  Future<List<WorkspacesModel>> getWorkspaces();

  /// Utworzenie nowego workspace'a
  @POST('/workspaces/create')
  Future<WorkspacesModel> createWorkspace(
    @Body() CreateWorkspaceModel createWorkspaceModel,
  );

  /// Edycja workspace'a
  @PATCH('/workspaces/{workspaceId}/edit')
  Future<WorkspacesModel> editWorkspace(
    @Path('workspaceId') String workspaceId,
    @Body() CreateWorkspaceModel editWorkspaceModel,
  );

  /// Usunięcie workspace'a
  @DELETE('/workspaces/{workspaceId}')
  Future<MessageResponse> deleteWorkspace(
    @Path('workspaceId') String workspaceId,
  );
}
