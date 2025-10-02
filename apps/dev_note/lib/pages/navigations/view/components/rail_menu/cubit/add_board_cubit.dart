import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'add_board_state.dart';

class AddBoardCubit extends Cubit<AddBoardState> {
  AddBoardCubit({
    required this.boardRepository,
  }) : super(AddBoardInitial());

  final BoardRepository boardRepository;

  Future<void> addBoard({
    required String name,
    required String projectId,
    required String workspaceId,
    String? description,
  }) async {
    try {
      emit(AddBoardLoading());
      await boardRepository.createBoard(
        BoardCreateRequest(
          workspaceId: workspaceId,
          name: name,
          projectId: projectId,
          description: description,
        ),
      );
      emit(AddBoardSuccess());
    } on ApiException catch (e, s) {
      Logger.error('AddBoardCubit', err: e, stackTrace: s);
      emit(AddBoardFailure(error: e));
    } catch (e, s) {
      Logger.error('AddBoardCubit', err: e, stackTrace: s);
      emit(AddBoardFailure(error: Exception('Wystąpił nieoczekiwany błąd \n $e')));
    }
  }
}
