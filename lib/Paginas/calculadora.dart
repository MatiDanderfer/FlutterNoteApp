// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculadora extends StatefulWidget{
  const Calculadora({super.key});
  
  @override
  State<Calculadora> createState() => _Calculadora();
}

class _Calculadora extends State<Calculadora> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  //variables
  final List<String> botones = [
  '7', '8', '9', '/',
  '4', '5', '6', 'x',
  '1', '2', '3', '-',
  '(', '0', ')', '+',
  'Ans','.', 'C' , '='
  ];

  bool _fueResuelto = false;


  String _expresion ='';

  //metodos
void _onPressButton(String buttonText) {
  setState(() {
    if (buttonText == 'C') {
      _expresion = '';
      _fueResuelto = false;
    } else if (buttonText == 'Ans' && _fueResuelto ){
      _fueResuelto = false;
    } else if(buttonText == '=') {
      try {
        _expresion = _calcularResultado(_expresion).toString();
        _fueResuelto = true;  // Marca que la operación fue resuelta
      } catch (e) {
        _expresion = "Error";
        _fueResuelto = true;
      }
    } else {
      if (_fueResuelto) {
        // Si presiona un número después de un resultado, inicia nueva expresión
        //if (_isNumeric(buttonText)) {
          _expresion = buttonText;
        /*} else {
          // Si presiona un operador, continúa con la expresión anterior
          _expresion += buttonText;
        }*/
        _fueResuelto = false;
      } else {
        _expresion += buttonText;  // Construye la expresión normalmente
      }
    }
  });
}

// Función para comprobar si la entrada es un número
/*bool _isNumeric(String s) {
  return double.tryParse(s) != null;
}*/


  double _calcularResultado(String expresion) {
    try {
    expresion = expresion.replaceAll('x', '*');  // Reemplaza 'x' con '*'
    Parser p = Parser();
    Expression exp = p.parse(expresion);
    ContextModel cm = ContextModel();  // Contexto para evaluar
    return exp.evaluate(EvaluationType.REAL, cm);
  } catch (e) {
    throw Exception('Expresión inválida');
  }
  }

  //UI
  @override
  Widget build(BuildContext context) {
  super.build(context);
  return Scaffold(
    appBar: AppBar(
      title: Text("Calculadora"),
      //backgroundColor: Colors.green,
    ),
    backgroundColor: Colors.lightBlue,
    body: SingleChildScrollView(  // Permite desplazamiento sin forzar el ancho
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),  // Espacio superior
          Center(  // Centra el contenedor
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,  // 70% del ancho de la pantalla
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text(
                _expresion.isEmpty ? '0' : _expresion,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),  // Espacio entre la pantalla y botones
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 400,  // Ancho máximo para los botones
              child: GridView.builder(
                shrinkWrap: true,  // Evita que expanda más de lo necesario
                physics: NeverScrollableScrollPhysics(),  // Desactiva el scroll interno del GridView
                itemCount: botones.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 140, 205, 235),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.all(20),  // Tamaño de los boton
                    ),
                    onPressed: () => _onPressButton(botones[index]),
                    child: Text(
                      botones[index],
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}