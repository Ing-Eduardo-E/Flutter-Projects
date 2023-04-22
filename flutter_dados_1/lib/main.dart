import 'package:flutter/material.dart';
import 'package:flutter_dados_1/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        //Agregamos un container con un gradiente
        body: GradientContainer(
            Color.fromARGB(255, 3, 58, 102), Color.fromARGB(255, 73, 49, 129)),
      ),
    ),
  );
}
