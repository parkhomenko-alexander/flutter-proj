import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dict/bloc/dictionary/bloc/dictionary_bloc.dart';
import 'package:flutter_dict/ui/shared/bottom_btn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DictionaryBloc>(context);
    return BlocBuilder<DictionaryBloc, DictionaryState>(
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.tertiary,
              strokeWidth: 4,
            ),
          );
        }

        if (state is LoadedDict) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Словарь',
                style: TextStyle(fontSize: 18, color: Colors.white60),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    child: Text('Меню'),
                  ),
                  ListTile(
                    title: const Text('Обновить'),
                    onTap: () {
                      bloc.add(RefreshDictionary());
                    },
                  ),
                  ListTile(
                    title: const Text('Добавить тег'),
                    onTap: () {
                      Navigator.pushNamed(context, '/add_tag');
                    },
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                ListView.builder(
                  itemCount: state.dict.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Divider(
                          color: Color.fromARGB(255, 134, 120, 77),
                        ),
                        Text(
                          state.dict[index].$2.word,
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                          ),
                        ),
                        Text(state.dict[index].$1.word),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RightBottomBtn(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/add_word',
                      );
                    },
                    label: 'Add word',
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(''),
          );
        }
      },
    );
  }
}
