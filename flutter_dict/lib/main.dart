import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dict/bloc/dictionary/bloc/dictionary_bloc.dart';
import 'package:flutter_dict/domain/db/db.dart';
import 'package:flutter_dict/domain/repositories/dict_repository.dart';
import 'package:flutter_dict/ui/screens/add_tag.dart';
import 'package:flutter_dict/ui/screens/add_word.dart';
import 'package:flutter_dict/ui/screens/home_page.dart';
import 'package:flutter_dict/ui/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            DictionaryBloc(DictRepository(Db()))..add(LoadDictionary()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          routes: {
            '/': (context) => HomeScreen(),
            '/add_word': (context) => AddWordScreen(),
            '/add_tag': (context) => AddTagScreen(),
          },
        ));
  }
}
