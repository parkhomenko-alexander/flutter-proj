part of 'dictionary_bloc.dart';

@immutable
abstract class DictionaryState {
  List<Object?> get props => [];
}

class LoadedDict extends DictionaryState {
  final List<(WordData, WordData)> dict;

  LoadedDict(this.dict);

  @override
  List<Object?> get props => [dict];
}

class Loading extends DictionaryState {}

class LoadedTags extends DictionaryState {
  final List<TagData> tags;
  
  LoadedTags(this.tags);
}
