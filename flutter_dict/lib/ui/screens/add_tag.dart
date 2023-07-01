import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dict/bloc/dictionary/bloc/dictionary_bloc.dart';
import 'package:flutter_dict/ui/shared/bottom_btn.dart';

class AddTagScreen extends StatelessWidget {
  AddTagScreen({super.key});

  final tag = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DictionaryBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Добавление',
          style: TextStyle(fontSize: 14, color: Colors.white60),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: tag,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    labelText: 'Новый тег',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RightBottomBtn(
                    label: 'Save',
                    onPressed: () {
                      bloc.add(AddTag(tag: tag.text));
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
