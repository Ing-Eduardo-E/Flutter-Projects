import 'package:flutter/material.dart';
import 'package:flutter_camara_ubicacion_4/models/place.dart';
import 'package:flutter_camara_ubicacion_4/screens/places_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList(
      {super.key,
      required this.places}); // Constructor de la clase PlaceList que recibe una lista de lugares

  final List<Place> places; // Lista de lugares

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de usuario
    if (places.isEmpty) {
      // Si la lista de lugares está vacía
      return Center(
        // Retorna un widget centrado en la pantalla
        child: Text(
          // Con un texto que indica que no hay lugares
          'Aún no tienes lugares, agrega uno!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.surface),
        ),
      );
    }
    // Si la lista de lugares no está vacía
    return ListView.builder(
      // Retorna un ListView que muestra los lugares
      itemCount: places
          .length, // La cantidad de elementos en la lista es igual a la cantidad de lugares
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          // El avatar es un círculo
          backgroundImage: FileImage(places[index]
              .image), // La imagen del avatar es la imagen del lugar
        ), // Cada elemento en la lista es un ListTile
        title: Text(
          // Con un título que muestra el nombre del lugar
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetailScreen(place: places[index]),
            ),
          );
        },
      ),
    );
  }
}
