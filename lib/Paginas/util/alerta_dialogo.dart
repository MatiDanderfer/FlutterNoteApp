// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:primera_app_matias/Paginas/util/mi_boton.dart';

class AlertaDialogo extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback enGuardar;
  VoidCallback enCancelar;
  AlertaDialogo({super.key , required this.controller, required this.enGuardar , required this.enCancelar});


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: const Color.fromARGB(255, 201, 182, 12),
      content: Container(
        height: 125,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nombre de tarea",
              ),
            ),
            Row(
              children: [
                //guardar
                MiBoton(texto: "Guardar", onPressed: enGuardar),
                //espacio entre todo
                const SizedBox(width: 16,),
                //cancelar
                MiBoton(texto: "Cancelar", onPressed: enCancelar),
              ],
            ),

          ],
        ),
      ),
    );
  }
}