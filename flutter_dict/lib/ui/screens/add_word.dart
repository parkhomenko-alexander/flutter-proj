import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dict/bloc/dictionary/bloc/dictionary_bloc.dart';
import 'package:flutter_dict/domain/db/db.dart';
import 'package:flutter_dict/domain/repositories/dict_repository.dart';
import 'package:flutter_dict/ui/shared/bottom_btn.dart';

class AddWordScreen extends StatelessWidget {
  AddWordScreen({
    super.key,
  });

  final word = TextEditingController();
  final translate = TextEditingController();
  String? tag;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DictionaryBloc>(context);
    bloc.add(LoadTags());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Добавление',
          style: TextStyle(fontSize: 14, color: Colors.white60),
        ),
      ),
      body: BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) {
          if (state is LoadedTags) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: word,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: const InputDecoration(
                          labelText: 'Новое слово',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: translate,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: const InputDecoration(
                          labelText: 'Перевод',
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                      //   child: DropdownButton(
                      //       onChanged: (value) {
                      //         setState(() {
                      //           tag = value!;
                      //         });
                      //       },
                      //       value: tag,
                      //       style: const TextStyle(color: Colors.deepPurple),
                      //       items:
                      //           state.tags.map<DropdownMenuItem<String>>((e) {
                      //         return DropdownMenuItem<String>(
                      //             value: e.tag, child: Text(e.tag));
                      //       }).toList()),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RightBottomBtn(
                          label: 'Back',
                          onPressed: () {
                            bloc.add(LoadDictionary());
                            Navigator.pushReplacementNamed(
                              context,
                              '/',
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RightBottomBtn(
                          label: 'Save',
                          onPressed: () {
                            bloc.add(AddWord(
                                word: word.text,
                                translate: translate.text,
                                tag: tag));
                            bloc.add(LoadDictionary());
                            Navigator.pushReplacementNamed(
                              context,
                              '/',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Center();
        },
      ),
    );
  }
}
