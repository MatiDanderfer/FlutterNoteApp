// ignore_for_file: prefer_const_constructors, unused_element, unused_field, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:primera_app_matias/Paginas/calculadora.dart';
import 'package:primera_app_matias/Paginas/primer_pagina.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  // Crea un PageStorageBucket para almacenar el estado
  final PageStorageBucket _bucket = PageStorageBucket();

  void _incrementarContador() {
    setState(() {
      _counter++;
    });
  }

  void _decrementarContador() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _bucket,  // Asigna el bucket
      child: Scaffold(
        appBar: AppBar(title: Text("Home Page"),),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 122, 115, 115),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header
                DrawerHeader(
                  child: Icon(
                    Icons.apps,
                    size: 48,
                  )
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("P R I M E R   P A G I N A"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/primer_pagina');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calculate),
                  title: Text("C A L C U L A D O R A"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/calculadora');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.note),
                  title: Text("N O T A S"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/notas');
                  },
                )
              ],
            ),
          ),

        ),
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Apretaste el botón este número de veces: "),
              Text(
                _counter.toString(),
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: _incrementarContador,
                child: Text("Incrementar"),
                onLongPress: _decrementarContador,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              ElevatedButton(
                onPressed: _decrementarContador,
                child: Text("Descontar contador"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrimerPagina()),
                  );
                },
                child: Text("A primera página"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Calculadora()) );
                },
                child: Text("Calculadora"))
            ],
          ),
        ),
      ),
    );
  }
}
