import 'package:flutter/material.dart';
import 'package:flutter_camera_maps/providers/user_places.dart';
import 'package:flutter_camera_maps/screens/add_place.dart';
import 'package:flutter_camera_maps/widgets/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: PlaceList(
        places: userPlaces, // Lista de lugares
      ), // Cuerpo de la pantalla
    );
  }
}
