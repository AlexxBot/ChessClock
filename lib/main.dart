import 'dart:io';

import 'package:ChessClockApp/provider/themeBloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'database/clock.dart';
import 'views/chessList-page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    //var path = Directory.current.path;
    //Hive
    //..init(path)
    ..registerAdapter(ClockAdapter());
  runApp(MyApp());
  //final appDocumentDir = await getApplicationDocumentsDirectory();
  //Hive.init(appDocumentDir.path);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeBloc(ThemeData.light()),
        child: Consumer<ThemeBloc>(builder: (context, bloc, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: context.watch<ThemeBloc>().tema,
            home: ChessListPage(),
          );
        }));
  }
}
