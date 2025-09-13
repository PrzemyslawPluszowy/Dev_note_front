import 'package:bloc/bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Tworzy i zarządza cyklem życia instancji [Bloc] lub  [Cubit] w hooku Flutter.
/// Przykład użycia:
/// ```dart
/// final loginCubit = useBloc(() => LoginCubit());
/// ```
/// automatycznie zamyka [Bloc] lub [Cubit] przy odmontowaniu widgetu.
B useBloc<B extends BlocBase<Object?>>(
  B Function() create, {
  List<Object?> keys = const [],
}) {
  final bloc = useMemoized(create, keys);

  useEffect(() => bloc.close, [bloc]);

  return bloc;
}
