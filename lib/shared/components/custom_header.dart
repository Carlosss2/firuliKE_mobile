import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onAddPressed;

  const CustomHeader({
    super.key,
    this.onSearchChanged,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Branding/Logo dinámico con Material Theme 3
          Row(
            children: [
              Text(
                'FiruliKE',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.primary, // 
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.pets, color: theme.colorScheme.primary, size: 28),
            ],
          ),
          const SizedBox(height: 16),
          
          // Buscador y Botón de Acción
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 0, // Material 3 usa tonalidades en lugar de sombras pesadas
                  color: theme.colorScheme.surfaceContainerHigh, // 🎨 Fondo adaptativo para inputs
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      onChanged: onSearchChanged,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Buscar a una mascota',
                        hintStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.search, color: theme.colorScheme.onSurfaceVariant),
                        prefixIconConstraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
              // Botón Añadir (+) adaptado a M3
              IconButton.filledTonal(
                onPressed: onAddPressed,
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.add, size: 26),
              ),
            ],
          ),
        ],
      ),
    );
  }
}