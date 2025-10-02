part of 'add_project_cubit.dart';

sealed class AddProjectState extends Equatable {
  const AddProjectState();

  @override
  List<Object> get props => [];
}

final class AddProjectInitial extends AddProjectState {}

final class AddProjectLoading extends AddProjectState {}

final class AddProjectSuccess extends AddProjectState {}

final class AddProjectFailure extends AddProjectState {
  const AddProjectFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}
