import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_camara_ubicacion_4/screens/places.dart';
import 'package:flutter_camara_ubicacion_4/themes.dart/theme.dart';


void main() {
  runApp(
    const ProviderScope(child: MyCadastre()),
  );
}

class MyCadastre extends StatelessWidget {
  const MyCadastre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places', // Título de la aplicación
      theme: theme, // Tema de la aplicación
      home: const PlacesScreen(), // Página de inicio de la aplicación
    );
  }
}
