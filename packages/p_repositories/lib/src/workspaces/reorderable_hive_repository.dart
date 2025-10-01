import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:p_repositories/repositories.dart';

/// Zapisuje i pobiera z local storage kolejnosc workspace'ow i projektow
/// oraz czy menu jest zwiniete
/// a takze ukrywa/pokazuje ukryte elementy

class ReorderableHiveRepository {
  static const String _boxName = 'reorderable';
  static const String _key = 'reorderable';

  Future<Box<ReorderableList>> get _box async =>
      Hive.openBox<ReorderableList>(_boxName);

  Future<void> update(ReorderableList items) async {
    final box = await _box;
    await box.put(_key, items);
  }

  Future<ReorderableList?> get() async {
    final box = await _box;
    return box.get(_key);
  }

  Future<void> clear() async {
    final box = await _box;
    await box.delete(_key);
  }
}

/// Zapisuje i pobiera z local storage czy ukryte elementy sa widoczne
/// np. ukryte workspace'y i projekty

class MenuHiddenMenuHiveRepository {
  static const String _boxName = 'menu_hidden';
  static const String _key = 'menu_hidden';

  Future<Box<bool>> get _box async => Hive.openBox<bool>(_boxName);

  Future<void> update(bool isHidden) async {
    final box = await _box;
    await box.put(_key, isHidden);
  }

  Future<bool> get() async {
    final box = await _box;
    return box.get(_key) ?? false;
  }

  Future<void> clear() async {
    final box = await _box;
    await box.delete(_key);
  }
}
