part of 'add_board_cubit.dart';

sealed class AddBoardState extends Equatable {
  const AddBoardState();

  @override
  List<Object> get props => [];
}

final class AddBoardInitial extends AddBoardState {}

final class AddBoardLoading extends AddBoardState {}

final class AddBoardSuccess extends AddBoardState {}

final class AddBoardFailure extends AddBoardState {
  const AddBoardFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}
