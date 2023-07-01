// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $WordTable extends Word with TableInfo<$WordTable, WordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word];
  @override
  String get aliasedName => _alias ?? 'word';
  @override
  String get actualTableName => 'word';
  @override
  VerificationContext validateIntegrity(Insertable<WordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
    );
  }

  @override
  $WordTable createAlias(String alias) {
    return $WordTable(attachedDatabase, alias);
  }
}

class WordData extends DataClass implements Insertable<WordData> {
  final int id;
  final String word;
  const WordData({required this.id, required this.word});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    return map;
  }

  WordCompanion toCompanion(bool nullToAbsent) {
    return WordCompanion(
      id: Value(id),
      word: Value(word),
    );
  }

  factory WordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
    };
  }

  WordData copyWith({int? id, String? word}) => WordData(
        id: id ?? this.id,
        word: word ?? this.word,
      );
  @override
  String toString() {
    return (StringBuffer('WordData(')
          ..write('id: $id, ')
          ..write('word: $word')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordData && other.id == this.id && other.word == this.word);
}

class WordCompanion extends UpdateCompanion<WordData> {
  final Value<int> id;
  final Value<String> word;
  const WordCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
  });
  WordCompanion.insert({
    this.id = const Value.absent(),
    required String word,
  }) : word = Value(word);
  static Insertable<WordData> custom({
    Expression<int>? id,
    Expression<String>? word,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
    });
  }

  WordCompanion copyWith({Value<int>? id, Value<String>? word}) {
    return WordCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordCompanion(')
          ..write('id: $id, ')
          ..write('word: $word')
          ..write(')'))
        .toString();
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tag];
  @override
  String get aliasedName => _alias ?? 'tag';
  @override
  String get actualTableName => 'tag';
  @override
  VerificationContext validateIntegrity(Insertable<TagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(attachedDatabase, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String tag;
  const TagData({required this.id, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  TagCompanion toCompanion(bool nullToAbsent) {
    return TagCompanion(
      id: Value(id),
      tag: Value(tag),
    );
  }

  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tag': serializer.toJson<String>(tag),
    };
  }

  TagData copyWith({int? id, String? tag}) => TagData(
        id: id ?? this.id,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.tag == this.tag);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> tag;
  const TagCompanion({
    this.id = const Value.absent(),
    this.tag = const Value.absent(),
  });
  TagCompanion.insert({
    this.id = const Value.absent(),
    required String tag,
  }) : tag = Value(tag);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? tag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tag != null) 'tag': tag,
    });
  }

  TagCompanion copyWith({Value<int>? id, Value<String>? tag}) {
    return TagCompanion(
      id: id ?? this.id,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagCompanion(')
          ..write('id: $id, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }
}

class $TranslateRelationTable extends TranslateRelation
    with TableInfo<$TranslateRelationTable, TranslateRelationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranslateRelationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
      'word_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES word (id)'));
  static const VerificationMeta _translateIdMeta =
      const VerificationMeta('translateId');
  @override
  late final GeneratedColumn<int> translateId = GeneratedColumn<int>(
      'translate_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES word (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, wordId, translateId, tagId];
  @override
  String get aliasedName => _alias ?? 'translate_relation';
  @override
  String get actualTableName => 'translate_relation';
  @override
  VerificationContext validateIntegrity(
      Insertable<TranslateRelationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word_id')) {
      context.handle(_wordIdMeta,
          wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta));
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('translate_id')) {
      context.handle(
          _translateIdMeta,
          translateId.isAcceptableOrUnknown(
              data['translate_id']!, _translateIdMeta));
    } else if (isInserting) {
      context.missing(_translateIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TranslateRelationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslateRelationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      wordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_id'])!,
      translateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}translate_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id']),
    );
  }

  @override
  $TranslateRelationTable createAlias(String alias) {
    return $TranslateRelationTable(attachedDatabase, alias);
  }
}

class TranslateRelationData extends DataClass
    implements Insertable<TranslateRelationData> {
  final int id;
  final int wordId;
  final int translateId;
  final int? tagId;
  const TranslateRelationData(
      {required this.id,
      required this.wordId,
      required this.translateId,
      this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word_id'] = Variable<int>(wordId);
    map['translate_id'] = Variable<int>(translateId);
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int>(tagId);
    }
    return map;
  }

  TranslateRelationCompanion toCompanion(bool nullToAbsent) {
    return TranslateRelationCompanion(
      id: Value(id),
      wordId: Value(wordId),
      translateId: Value(translateId),
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
    );
  }

  factory TranslateRelationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslateRelationData(
      id: serializer.fromJson<int>(json['id']),
      wordId: serializer.fromJson<int>(json['wordId']),
      translateId: serializer.fromJson<int>(json['translateId']),
      tagId: serializer.fromJson<int?>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wordId': serializer.toJson<int>(wordId),
      'translateId': serializer.toJson<int>(translateId),
      'tagId': serializer.toJson<int?>(tagId),
    };
  }

  TranslateRelationData copyWith(
          {int? id,
          int? wordId,
          int? translateId,
          Value<int?> tagId = const Value.absent()}) =>
      TranslateRelationData(
        id: id ?? this.id,
        wordId: wordId ?? this.wordId,
        translateId: translateId ?? this.translateId,
        tagId: tagId.present ? tagId.value : this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('TranslateRelationData(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('translateId: $translateId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, wordId, translateId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslateRelationData &&
          other.id == this.id &&
          other.wordId == this.wordId &&
          other.translateId == this.translateId &&
          other.tagId == this.tagId);
}

class TranslateRelationCompanion
    extends UpdateCompanion<TranslateRelationData> {
  final Value<int> id;
  final Value<int> wordId;
  final Value<int> translateId;
  final Value<int?> tagId;
  const TranslateRelationCompanion({
    this.id = const Value.absent(),
    this.wordId = const Value.absent(),
    this.translateId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  TranslateRelationCompanion.insert({
    this.id = const Value.absent(),
    required int wordId,
    required int translateId,
    this.tagId = const Value.absent(),
  })  : wordId = Value(wordId),
        translateId = Value(translateId);
  static Insertable<TranslateRelationData> custom({
    Expression<int>? id,
    Expression<int>? wordId,
    Expression<int>? translateId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wordId != null) 'word_id': wordId,
      if (translateId != null) 'translate_id': translateId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  TranslateRelationCompanion copyWith(
      {Value<int>? id,
      Value<int>? wordId,
      Value<int>? translateId,
      Value<int?>? tagId}) {
    return TranslateRelationCompanion(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      translateId: translateId ?? this.translateId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
    }
    if (translateId.present) {
      map['translate_id'] = Variable<int>(translateId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslateRelationCompanion(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('translateId: $translateId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Db extends GeneratedDatabase {
  _$Db(QueryExecutor e) : super(e);
  late final $WordTable word = $WordTable(this);
  late final $TagTable tag = $TagTable(this);
  late final $TranslateRelationTable translateRelation =
      $TranslateRelationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [word, tag, translateRelation];
}
