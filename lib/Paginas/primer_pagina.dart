// ignore_for_file: no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:primera_app_matias/Paginas/home_page.dart';

class PrimerPagina extends StatefulWidget {
  const PrimerPagina({super.key});
  
  @override
  State<PrimerPagina> createState()  => _PrimeraPagina();
}

class _PrimeraPagina extends State<PrimerPagina> with AutomaticKeepAliveClientMixin {

//variables


//metodos



//UI
@override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text("Primera Pagina"),),
      backgroundColor: const Color.fromARGB(255, 27, 190, 32),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Primera pagina "),
              ElevatedButton(
  onPressed: () {
    Navigator.pop(context);  // Volver a la HomePage
  },
  child: Text('Volver a Home'),
),

            ],
          ),
        ),
    ));
  }

  @override
  bool get wantKeepAlive => true;

}