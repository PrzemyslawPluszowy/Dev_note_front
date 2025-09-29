import 'package:dio/dio.dart';
import 'package:p_repositories/repositories.dart';
import 'package:retrofit/retrofit.dart';

part 'board_repository.g.dart';

@RestApi()
abstract class BoardRepository {
  factory BoardRepository(Dio dio, {String baseUrl}) = _BoardRepository;

  @POST('/boards/create')
  Future<void> createBoard(@Body() BoardCreateRequest request);
}
