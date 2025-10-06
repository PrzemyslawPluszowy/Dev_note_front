import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'board_get_state.dart';

class BoardGetCubit extends Cubit<BoardGetState> {
  BoardGetCubit({required this.boardRepository, required this.workItemRepository, required this.boardId})
    : super(BoardGetInitialLoading()) {
    // Start initial load without forcing a second loading indicator (default true).
    unawaited(getBoardFullData(boardId: boardId));
  }
  final String boardId;
  final BoardRepository boardRepository;
  final WorkItemRepository workItemRepository;
  List<BoardCategoryModel> tmpForErrorHandling = [];

  Future<void> getBoardFullData({required String boardId, bool emitLoading = true}) async {
    try {
      if (emitLoading) {
        emit(BoardGetInitialLoading());
      }

      final boardData = await SafeApiCall.call(
        () => boardRepository.getBoardFullData(boardId),
      );

      emit(BoardGetSuccess(boardData: boardData, status: BoardGetStatus.ok));
    } on ApiException catch (e, s) {
      Logger.error('BoardGetCubit.getBoardFullData ApiException', err: e, stackTrace: s);
      emit(BoardGetError(exception: e));
    } catch (e, s) {
      Logger.error('BoardGetCubit.getBoardFullData', err: e, stackTrace: s);
      emit(BoardGetError(exception: Exception('Unknown error\n $e $s')));
    }
  }

  Future<void> createWorkItem(WorkItemCreate workItemCreate) async {
    if (state case BoardGetSuccess(:final boardData)) {
      emit(BoardGetSuccess(boardData: boardData, status: BoardGetStatus.working));
      try {
        await SafeApiCall.call(
          () => workItemRepository.createWorkItem(workItemCreate),
        );
        // Refresh the board data after creating a work item
        await getBoardFullData(boardId: boardId, emitLoading: false);
      } on ApiException catch (e, s) {
        Logger.error('BoardGetCubit.createWorkItem ApiException', err: e, stackTrace: s);
        emit(BoardGetSuccess(boardData: boardData, status: BoardGetStatus.error, exception: e));
      } catch (e, s) {
        Logger.error('BoardGetCubit.createWorkItem', err: e, stackTrace: s);
        emit(
          BoardGetSuccess(
            boardData: boardData,
            status: BoardGetStatus.error,
            exception: Exception('Unknown error\n $e $s'),
          ),
        );
      }
    }
  }

  Future<void> reorderCategories(int oldIndex, int newIndex) async {
    if (state case BoardGetSuccess(:final boardData)) {
      // Create a copy of the current categories for error handling
      tmpForErrorHandling = List.of(boardData.categories);

      final categories = List.of(boardData.categories);
      final category = categories.removeAt(oldIndex);
      categories.insert(newIndex, category);

      final updatedBoardData = boardData.copyWith(categories: categories);

      // Optimistically emit the new state
      emit(BoardGetSuccess(boardData: updatedBoardData, status: BoardGetStatus.ok));

      // Try to persist in background and handle errors
      try {
        await _persistReorderCategories(categories);
      } on ApiException catch (e, s) {
        Logger.error('BoardGetCubit.reorderCategories ApiException', err: e, stackTrace: s);
        // Revert to the previous state in case of an error
        emit(
          BoardGetSuccess(
            boardData: boardData.copyWith(categories: tmpForErrorHandling),
            status: BoardGetStatus.error,
            exception: e,
          ),
        );
      } catch (e, s) {
        Logger.error('BoardGetCubit.reorderCategories', err: e, stackTrace: s);
        // Revert to the previous state in case of an error
        emit(
          BoardGetSuccess(
            boardData: boardData.copyWith(categories: tmpForErrorHandling),
            status: BoardGetStatus.error,
            exception: Exception('Unknown error\n $e $s'),
          ),
        );
      }
    }
  }

  Future<void> _persistReorderCategories(List<BoardCategoryModel> categories) async {
    try {
      final categoriesToPersist = List<BoardCategoryModel>.of(categories);
      for (var i = 0; i < categoriesToPersist.length; i++) {
        categoriesToPersist[i] = categoriesToPersist[i].copyWith(order: i);
      }

      await SafeApiCall.call(
        () => boardRepository.reorderBoardCategories(
          boardId,
          BoardCategoryReorderRequest(
            categories: categoriesToPersist.map((e) => CategoryReorderItem(id: e.id, order: e.order)).toList(),
          ),
        ),
      );
    } catch (e, s) {
      Logger.error('BoardGetCubit._persistReorderCategories', err: e, stackTrace: s);
      rethrow;
    }
  }

  void clearException() {
    if (state is BoardGetSuccess) {
      emit((state as BoardGetSuccess).copyWith(clearException: true));
    }
  }

  Future<void> moveItem({
    required String workItemId,
    required WorkItemReorder workItemReorder,
  }) async {
    if (state is BoardGetSuccess) {
      await SafeApiCall.call(
        () => workItemRepository.moveWorkItem(workItemId, workItemReorder),
      );
      await getBoardFullData(boardId: boardId, emitLoading: false);
    }
  }
}
