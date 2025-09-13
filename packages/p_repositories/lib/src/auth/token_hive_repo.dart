import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:p_models/models.dart';

class TokenHiveRepo {
  static const String _boxName = 'token';
  static const String _key = 'token';

  Future<Box<LoginResponse>> get _box async =>
      Hive.openBox<LoginResponse>(_boxName);

  Future<void> saveAccessToken(LoginResponse token) async {
    final box = await _box;
    await box.put(_key, token);
  }

  Future<LoginResponse?> getAccessToken() async {
    final box = await _box;
    return box.get(_key);
  }

  Future<void> clearTokens() async {
    final box = await _box;
    await box.delete(_key);
  }
}
