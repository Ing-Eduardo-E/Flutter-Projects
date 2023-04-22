import 'package:flutter/material.dart';
import 'package:flutter_dados_1/dice_roller.dart';

//Creacion de variable para el inicio del gradiente
const startAlignment = Alignment.topLeft;
//Creacion de variable para el final del gradiente
const endAlignment = Alignment.bottomRight;

//Creación de un widget personalizado
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorOne, this.colorTwo, {super.key});

  //Creamos las variables para los colores
  final Color colorOne;
  final Color colorTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Agregamos las valiables colores
          colors: [
            colorOne,
            colorTwo,
          ],
          //agregar inicio y final del gradiente
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
