import 'package:flutter/material.dart';

class AppointmentsSection extends StatelessWidget {
  const AppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Proxima citas',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          
          // Contenedor adaptivo usando Material 3 tokens
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest, // 🎨 Color gris neutro suave oficial M3
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'No hay citas programadas', 
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}