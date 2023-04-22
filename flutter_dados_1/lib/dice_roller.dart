import 'dart:math';
import 'package:flutter/material.dart';

final randomizer =
    Random(); //Creamos una variable para generar un numero aleatorio

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  //Creamos una funcion para generar un numero aleatorio y tirar los dados
  void tirarDados() {
    //Creamos una variable para generar un numero aleatorio
    setState(() {
      currentDiceRoll =
          randomizer.nextInt(6) + 1; //Genera un numero aleatorio entre 1 y 6
    });

    //Agregamos un setState para que se actualice la interfaz
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //Agregamos el main axis alignment para centrar el contenido
      mainAxisSize: MainAxisSize.min,
      //Como quieremos que la imagen y el texto esten centrados, los agrupamos en una lista dentro del widget Column
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        //Agregaremos una caja que ocupara un espacio dentro de la interfaz pero que no tendra contenido
        const SizedBox(
          height: 20,
        ),
        TextButton(
          //En on pressed agregamos una funcion que la creamos despues de las variables
          onPressed: tirarDados,
          //Agregamos estilo al boton
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
            //padding: const EdgeInsets.only(top: 20),
          ),
          child: const Text('Tirar Dado'),
        ),
      ],
    );
  }
}
