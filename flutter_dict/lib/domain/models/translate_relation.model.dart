import 'package:drift/drift.dart';
import 'package:flutter_dict/domain/models/tag.model.dart';
import 'package:flutter_dict/domain/models/word.model.dart';

class TranslateRelation extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wordId => integer().references(Word, #id)();
  IntColumn get translateId => integer().references(Word, #id)();
  IntColumn get tagId => integer().nullable().references(Tag, #id)();
}
