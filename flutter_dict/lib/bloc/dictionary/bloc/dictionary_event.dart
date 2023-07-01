part of 'dictionary_bloc.dart';

@immutable
abstract class DictionaryEvent {}

class LoadDictionary extends DictionaryEvent {}

class RefreshDictionary extends DictionaryEvent {}

class AddWord extends DictionaryEvent {
  final String word;
  final String translate;
  final String? tag;

  AddWord({required this.word, required this.translate, this.tag});
}

class AddTag extends DictionaryEvent {
  final String tag;

  AddTag({required this.tag});
}

class LoadTags extends DictionaryEvent {
  LoadTags();
}
