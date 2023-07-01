import 'package:bloc/bloc.dart';
import 'package:flutter_dict/domain/db/db.dart';
import 'package:flutter_dict/domain/repositories/dict_repository.dart';
import 'package:meta/meta.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final DictRepository _dictRepository;

  DictionaryBloc(this._dictRepository) : super(Loading()) {
    on<LoadDictionary>(_onLoadDict);
    on<AddWord>(_addWord);
    on<RefreshDictionary>(_onRefresh);
    on<AddTag>(_onAddTag);
    on<LoadTags>(_onLoadTags);
  }

  void _onLoadDict(LoadDictionary event, Emitter<DictionaryState> emit) async {
    emit(Loading());
    final List<(WordData, WordData)> res = await _dictRepository.getAll();
    emit(LoadedDict(res));
  }

  void _addWord(AddWord event, Emitter<DictionaryState> emit) async {
    await _dictRepository.insert(event.word, event.translate, event.tag);
    emit(Loading());
    final List<(WordData, WordData)> res = await _dictRepository.getAll();
    emit(LoadedDict(res));
  }

  void _onRefresh(
      RefreshDictionary event, Emitter<DictionaryState> emit) async {
    emit(Loading());
    await _dictRepository.getRemote();
    final List<(WordData, WordData)> res = await _dictRepository.getAll();
    emit(LoadedDict(res));
  }

  void _onAddTag(AddTag event, Emitter<DictionaryState> emit) async {
    final res = await _dictRepository.addTag(event.tag);
  }

  void _onLoadTags(LoadTags event, Emitter<DictionaryState> emit) async {
    final res = await _dictRepository.getTagsName();
    emit(LoadedTags(res));
  }

  DictRepository getDictRepository() {
    return _dictRepository;
  }
}
