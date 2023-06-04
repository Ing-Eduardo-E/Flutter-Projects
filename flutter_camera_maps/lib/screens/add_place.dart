import 'package:flutter/material.dart';
import 'package:flutter_camera_maps/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController =
      TextEditingController(); // Controlador para el campo de texto del título

  void _savePlace() {
    final enteredTitle = _titleController.text; // Obtener el texto del título
    if (enteredTitle.isEmpty) {
      // Si el texto está vacío
      return; // No hacer nada
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle); // Añadir lugar

    Navigator.of(context).pop(); // Cerrar la pantalla
  }

  @override
  void dispose() {
    _titleController.dispose(); // Liberar recursos del controlador del título
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un nuevo lugar'), // Título de la pantalla
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Título', // Etiqueta del campo de texto
                labelStyle: TextStyle(
                  color: Colors.red, // Color de la etiqueta
                  fontSize: 18, // Tamaño de la fuente de la etiqueta
                ),
              ),
              controller:
                  _titleController, // Asignar el controlador del título al campo de texto
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onPrimary, // Color del texto del campo de texto
              ),
            ),
            const SizedBox(height: 16), // Espacio en blanco
            ElevatedButton.icon(
              onPressed: _savePlace, // Acción al presionar el botón
              icon: const Icon(Icons.add), // Icono del botón
              label: const Text("Agregar lugar"), // Texto del botón
            )
          ],
        ),
      ),
    );
  }
}
