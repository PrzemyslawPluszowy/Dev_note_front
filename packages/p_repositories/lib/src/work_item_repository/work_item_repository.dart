import 'package:dio/dio.dart';
import 'package:p_repositories/repositories.dart';
import 'package:retrofit/retrofit.dart';

part 'work_item_repository.g.dart';

@RestApi()
abstract class WorkItemRepository {
  factory WorkItemRepository(Dio dio, {String baseUrl}) = _WorkItemRepository;
  // /work-items
  @POST('/work-items')
  Future<void> createWorkItem(@Body() WorkItemCreate workItemCreate);

  ///work-items/{workItemId}/move
  @PATCH('/work-items/{workItemId}/move')
  Future<void> moveWorkItem(
    @Path() String workItemId,
    @Body() WorkItemReorder workItemReorder,
  );
}
