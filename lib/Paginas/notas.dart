// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:primera_app_matias/Paginas/util/alerta_dialogo.dart';
import 'package:primera_app_matias/Paginas/util/tarea.dart';

class Notas extends StatefulWidget{
  const Notas({super.key});

  //final String nombreTarea;
  //final bool tareaCompletada;

  
  @override
  State<Notas> createState() => _Notas  ();

}

class _Notas extends State<Notas> {

  final _controller  = TextEditingController();

  List taresParaHacer = [
    //["Tutorial 1 ", false],
    //["Tutorial 2 ", true],
  ];

  void checkBoxChange (bool? value, int index){
      setState(() {
        taresParaHacer[index][1] = !taresParaHacer[index][1];
      });
  }

//guardar la tarea

void guardarNuevaNota(){
  setState(() {
    taresParaHacer.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

//borrar tarea de la lista

void borrarTarea(int index){
  setState(() {
    taresParaHacer.removeAt(index);
  });
}


//crea la nueva tarea

  void agregarTarea (){
    showDialog(
      context: context, 
      builder: (context){
        return AlertaDialogo(
          controller: _controller,
          enGuardar: guardarNuevaNota,
          enCancelar: () => {Navigator.of(context).pop() , _controller.clear(), },
          );
      } );
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloque de Notas"),
        //backgroundColor: const Color.fromARGB(255, 235, 216, 46),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarTarea,
        child: Icon(Icons.add),
        ),
      backgroundColor: const Color.fromARGB(255, 252, 232, 51),
      body: ListView.builder(
            itemCount: taresParaHacer.length,
            itemBuilder: (context,index){
              return Tarea(nombreTarea: taresParaHacer[index][0], tareaCompletada: taresParaHacer[index][1], onChanged: (value) => checkBoxChange(value, index) , deleteTarea: (context) => borrarTarea(index), );
            },
      )
    );
  }


  
}