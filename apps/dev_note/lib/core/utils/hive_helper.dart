import 'dart:async';
import 'dart:io';

import 'package:dev_note/core/utils/hive_registrar.g.dart';
import 'package:dev_note/main.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:p_repositories/repositories.dart';
import 'package:path_provider/path_provider.dart';

part 'hive_helper.g.dart';

class HiveHelper {
  factory HiveHelper() => _instance;
  HiveHelper._internal();
  static final HiveHelper _instance = HiveHelper._internal();

  static Future<void> init() async {
    await Hive.initFlutter(
      'dev_note',
    );
    try {
      Hive.registerAdapters();
    } on Exception catch (e, s) {
      await Hive.close();
      //remove all files from hive
      final directory = await getApplicationDocumentsDirectory();
      final hivePath = '${directory.path}/excellent_crm';
      final hiveDirectory = Directory(hivePath);
      if (hiveDirectory.existsSync()) {
        final files = hiveDirectory.list();
        await for (final file in files) {
          await file.delete();
        }
      }

      logger.error('Error: $e, StackTrace: $s');
    }

    // Usunięcie danych z bazy danych, aby uniknąć konfliktów
    // z generowanego pliku
    // await clearDb();
    // try {
    //   Hive.registerAdapters();
    // } on Exception catch (e, s) {
    //   talker.error('Error: $e, StackTrace: $s');
    //   unawaited(Sentry.captureException(e, stackTrace: s));
    //   await clearDb();
    // }
  }
}

@GenerateAdapters([
  AdapterSpec<LoginRequest>(),
])
// To jes to do generacji plików *.g.dart nie usuwać
// ignore: unused_element
void _() {}
