import 'package:uuid/uuid.dart';
import 'dart:io';

// Importamos la librería uuid para generar identificadores únicos
const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

// Definimos la clase Place
class Place {
  // Constructor de la clase, recibe el título del lugar y genera un id único
  Place({
    required this.title,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();

  // Atributos de la clase
  final String id; // Id único del lugar
  final String title; // Título del lugar
  final File image; // Imagen del lugar
  final PlaceLocation location; // Ubicación del lugar
}
