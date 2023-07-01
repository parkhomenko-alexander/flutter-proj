import 'package:drift/drift.dart';

class Word extends Table {
  
  IntColumn get id => integer().autoIncrement().unique()();
  TextColumn get word => text().withLength(max: 255)();
}
