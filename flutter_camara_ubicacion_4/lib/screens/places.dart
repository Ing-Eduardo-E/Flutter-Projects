import 'package:flutter/material.dart';
import 'package:flutter_camara_ubicacion_4/themes.dart/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_camara_ubicacion_4/providers/user_places.dart';
import 'package:flutter_camara_ubicacion_4/screens/add_place.dart';
import 'package:flutter_camara_ubicacion_4/widgets/places_list.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key}); // Constructor de la clase PlacesScreen

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
            child: FutureBuilder(
              future: _placesFuture,
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PlacesList(places: userPlaces),
            ),
          ),
        ),
      ), // Cuerpo de la pantalla
    );
  }
}
