import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_dict/domain/db/db.dart';
import 'package:flutter_dict/domain/models/word.model.dart';
import 'package:http/http.dart' as http;

class DictRepository {
  final String _baseUrl = 'http://10.0.2.2:5000/get_dict';
  final Db _db;

  DictRepository(this._db);

  List parseRemoteDict(String responseBody) {
    final parsed = jsonDecode(responseBody)['data'];
    print(parsed[0]);
    return [];
  }

  Future<List<WordData>> ifWordInDb(String wordForCheck) async {
    return (_db.select(_db.word)..where((tbl) => tbl.word.equals(wordForCheck)))
        .get();
  }

  Future<List<TagData>> ifTagInDb(String tagForCheck) async {
    return (_db.select(_db.tag)..where((tbl) => tbl.tag.equals(tagForCheck)))
        .get();
  }

  Future<List<Word>?> getRemote() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['data'];

      for (var element in data) {
        final List<WordData> exsistWords = await ifWordInDb(element['word']);

        if (exsistWords.isNotEmpty) {
          continue;
        }

        final wordId = await _db
            .into(_db.word)
            .insert(WordCompanion.insert(word: element['word']));

        final translateId = await _db
            .into(_db.word)
            .insert(WordCompanion.insert(word: element['translation']));

        await _db.into(_db.translateRelation).insert(
            TranslateRelationCompanion.insert(
                wordId: wordId, translateId: translateId));
      }
    } else {
      print('not success');
    }
    return null;
  }

  Future<List<(WordData, WordData)>> getAll() async {
    final alias = _db.alias(_db.word, 'wordAlias');

    final res = _db.select(_db.translateRelation).join([
      innerJoin(_db.word, _db.word.id.equalsExp(_db.translateRelation.wordId)),
      innerJoin(alias, alias.id.equalsExp(_db.translateRelation.translateId)),
    ]);

    return await res
        .map((row) => (row.readTable(alias), row.readTable(_db.word)))
        .get();
  }

  Future<Word?> getOne(int id) async {
    return null;
  }

  Future<void> insert(String word, String translate, tag) async {
    final List<WordData> exsistWords = await ifWordInDb(word);

    if (exsistWords.isEmpty) {
      final wordId =
          await _db.into(_db.word).insert(WordCompanion.insert(word: word));
      final translateId = await _db
          .into(_db.word)
          .insert(WordCompanion.insert(word: translate));

      // TagData tagD = await (_db.select(_db.tag)..where((t) => t.tag.equals(tag))).getSingle();

      await _db.into(_db.translateRelation).insert(
          TranslateRelationCompanion.insert(
              wordId: wordId, translateId: translateId));
    }
  }

  Future<void> addTag(String tag) async {
    final List<TagData> exsistTag = await ifTagInDb(tag);

    if (exsistTag.isEmpty) {
      final tagId =
          await _db.into(_db.tag).insert(TagCompanion.insert(tag: tag));
    }
  }

  Future<List<TagData>> getTagsName() async {
    final res = await _db.select(_db.tag).get();
    return await res;
  }
}
