import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_dict/domain/models/tag.model.dart';
import 'package:flutter_dict/domain/models/translate_relation.model.dart';
import 'package:flutter_dict/domain/models/word.model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

// abd root
// adb shell
// com.example.flutter_dict
// adb shell && rm /data/data/com.example.flutter_dict/add_flutter/db.sqlite
// adb exec-out run-as com.example.flutter_dict
// adb pull /data/data/com.example.flutter_dict/app_flutter/db.sqlite C:/Users/saksa/Desktop
// dart run build_runner watch
// dart run build_runner watch --delete-conflicting-outputs
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    NativeDatabase.createInBackground(file);
    return NativeDatabase.createInBackground(file);
    // return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Word, TranslateRelation, Tag])
class Db extends _$Db {
  Db() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }
}
