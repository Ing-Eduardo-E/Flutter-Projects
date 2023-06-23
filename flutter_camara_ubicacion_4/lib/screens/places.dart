import 'package:flutter/material.dart';
import 'package:flutter_camara_ubicacion_4/themes.dart/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_camara_ubicacion_4/providers/user_places.dart';
import 'package:flutter_camara_ubicacion_4/screens/add_place.dart';
import 'package:flutter_camara_ubicacion_4/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key}); // Constructor de la clase PlacesScreen

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces =
        ref.watch(userPlacesProvider); // Observar los lugares del usuario
    // Método que construye la pantalla
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis lugares'), // Título de la barra de navegación
        actions: [
          IconButton(
              icon: const Icon(Icons.add), // Icono de añadir lugar
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const AddPlaceScreen(),
                  ),
                );
              } // Acción al presionar el botón
              ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Theme(
          data: theme, // Tema deseado
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlacesList(
              places: userPlaces, // Lista de lugares
            ),
          ),
        ),
      ), // Cuerpo de la pantalla
    );
  }
}
