import 'package:dio/dio.dart';
import 'package:p_repositories/repositories.dart';
import 'package:retrofit/retrofit.dart';

part 'board_repository.g.dart';

@RestApi()
abstract class BoardRepository {
  factory BoardRepository(Dio dio, {String baseUrl}) = _BoardRepository;

  @POST('/boards/create')
  Future<void> createBoard(@Body() BoardCreateRequest request);

  // /boards/{boardId}/full-data
  @GET('/boards/{boardId}/full-data')
  Future<BoardDataResponse> getBoardFullData(@Path('boardId') String boardId);

  // /board-categories/{boardId}/reorder
  @PUT('/board-categories/{boardId}/reorder')
  Future<void> reorderBoardCategories(
    @Path('boardId') String boardId,
    @Body() BoardCategoryReorderRequest request,
  );
}
