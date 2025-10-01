part of 'delete_project_cubit.dart';

sealed class DeleteProjectState extends Equatable {
  const DeleteProjectState();

  @override
  List<Object> get props => [];
}

final class DeleteProjectInitial extends DeleteProjectState {}

final class DeleteProjectLoading extends DeleteProjectState {}

final class DeleteProjectSuccess extends DeleteProjectState {}

final class DeleteProjectFailure extends DeleteProjectState {
  const DeleteProjectFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}
