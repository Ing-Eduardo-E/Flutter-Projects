import 'package:flutter/material.dart';

// Clase ChartBar que extiende de StatelessWidget
class ChartBar extends StatelessWidget {
  // Constructor de la clase con parámetros requeridos
  const ChartBar({
    Key? key,
    required this.fill,
  }) : super(key: key);

  // Variable final de tipo double que representa el porcentaje de llenado de la barra
  final double fill;

  // Método build que construye el widget
  @override
  Widget build(BuildContext context) {
    // Variable que determina si el modo oscuro está activado
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    // Widget Expanded que expande el hijo para llenar el espacio disponible
    return Expanded(
      // Widget Padding que agrega un relleno alrededor del hijo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        // Widget FractionallySizedBox que dimensiona su hijo en una fracción del tamaño total disponible
        child: FractionallySizedBox(
          heightFactor: fill,
          // Widget DecoratedBox que dibuja una decoración detrás o delante de su hijo
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}
