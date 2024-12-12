// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:math_expressions/math_expressions.dart';

class Tarea extends StatelessWidget {

  final String nombreTarea;
  final bool tareaCompletada;
  Function(bool?) ? onChanged;
  Function(BuildContext)? deleteTarea;
  
   Tarea({
    super.key,
    required this.nombreTarea, 
    required this.tareaCompletada,
    required this.onChanged,
    required this.deleteTarea,});
  
  



  @override
  Widget build(BuildContext context) {
   return Padding(
    padding : const EdgeInsets.only(right: 25, left: 25,top: 25),
     //padding: const EdgeInsets.all(8.0),
     child: Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(), 
        children:[
          //Delete buttom
          SlidableAction(onPressed: deleteTarea, 
          icon: Icons.delete ,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(25),)
        ]),
       child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Checkbox(
              value: tareaCompletada, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
            Text(
              nombreTarea,
              style: TextStyle(
                decoration: tareaCompletada
                 ? TextDecoration.lineThrough
                 : TextDecoration.none,
              ),),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width:1),
        ),
       ),
     ),
   );
  }
  
}