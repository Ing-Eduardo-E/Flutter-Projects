import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.location_on),
            label: const Text('Obtener ubicación actual'),
            onPressed: () {},
          ),
          TextButton.icon(
            icon: const Icon(Icons.map),
            label: const Text('Seleccionar en el mapa'),
            onPressed: () {},
          )
        ],
      )
    ]);
  }
}
