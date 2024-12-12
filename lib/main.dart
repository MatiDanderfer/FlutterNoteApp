// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:primera_app_matias/Paginas/calculadora.dart';
import 'package:primera_app_matias/Paginas/home_page.dart';
import 'package:primera_app_matias/Paginas/notas.dart';
import 'package:primera_app_matias/Paginas/primer_pagina.dart';
//import 'package:hive/hive.dart';
//import 'package:path_provider/path_provider.dart';

void main() {
  /*
  //init hive generator
  WidgetsFlutterBinding.ensureInitialized();
  //final directory = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = directory.path; */
  runApp(const MyApp());
}

/*extension on HiveInterface {
  set defaultDirectory(String defaultDirectory) {}
}*/

class MyApp extends StatelessWidget{
  const MyApp({super.key});

// Aca es el inicio de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch:  Colors.lightBlue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan,
        )),
      routes: {
        '/primer_pagina' : (context) => PrimerPagina(),
        '/calculadora' : (context) => Calculadora(),
        '/notas' : (context) => Notas(),
      },
    );
  }
}