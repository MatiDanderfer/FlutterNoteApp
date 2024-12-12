// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MiBoton extends StatelessWidget {
   MiBoton({
         super.key,
         required this.texto,
         required this.onPressed,
  });


  final String texto;
  VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(texto),
    );
  }
}