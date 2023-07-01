import 'package:drift/drift.dart';

class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tag => text().withLength(max: 255)();

  IntColumn getId() {
    return id;
  }
}
