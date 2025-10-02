import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';

part 'add_workspace_state.dart';

class AddWorkspaceCubit extends Cubit<AddWorkspaceState> {
  AddWorkspaceCubit({
    required this.workspacesRepository,
  }) : super(const AddWorkspaceInitial());

  final WorkspacesRepository workspacesRepository;

  Future<void> createWorkspace({
    required String name,
    String? description,
    ApiColorScheme? color,
    ApiPhosphorIcons? icon,
  }) async {
    emit(const AddWorkspaceLoading());
    try {
      await workspacesRepository.createWorkspace(
        CreateWorkspaceModel(
          name: name,
          description: description,
          primaryColor: color,
          icon: icon,
        ),
      );
      if (isClosed) return;
      emit(const AddWorkspaceSuccess());
    } on ApiException catch (e, s) {
      Logger.error('AddWorkspaceCubit.createWorkspace', err: e, stackTrace: s);
      if (isClosed) return;
      emit(AddWorkspaceFailure(exception: e));
    } catch (e, s) {
      Logger.error('AddWorkspaceCubit.createWorkspace', err: e, stackTrace: s);
      if (isClosed) return;
      emit(AddWorkspaceFailure(exception: Exception(e.toString())));
    }
  }
}
