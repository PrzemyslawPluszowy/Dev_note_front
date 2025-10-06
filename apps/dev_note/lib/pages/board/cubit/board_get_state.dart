part of 'board_get_cubit.dart';

/// Status boardów
/// - ok - załadowano dane
/// - working - trwa operacja (np. reorder)
/// - error - wystąpił błąd
enum BoardGetStatus { ok, working, error }

sealed class BoardGetState extends Equatable {
  const BoardGetState();

  @override
  List<Object?> get props => [];
}

final class BoardGetInitialLoading extends BoardGetState {}

final class BoardGetSuccess extends BoardGetState {
  const BoardGetSuccess({
    required this.status,
    required this.boardData,
    this.exception,
  });

  final BoardGetStatus status;
  final BoardDataResponse boardData;
  final Exception? exception;

  BoardGetSuccess copyWith({
    BoardGetStatus? status,
    BoardDataResponse? boardData,
    Exception? exception,
    bool clearException = false,
  }) {
    return BoardGetSuccess(
      status: status ?? this.status,
      boardData: boardData ?? this.boardData,
      exception: clearException ? null : exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [boardData, status, exception];
}

final class BoardGetError extends BoardGetState {
  const BoardGetError({required this.exception});

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
