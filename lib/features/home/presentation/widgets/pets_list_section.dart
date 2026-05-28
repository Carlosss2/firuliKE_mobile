import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/pets_provider.dart';

class PetsListSection extends StatelessWidget {
  const PetsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PetsProvider>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mis mascotas',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          
          if (provider.isLoading)
            const Center(child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator()))
          else if (provider.error != null)
            Center(child: Text(provider.error!, style: TextStyle(color: theme.colorScheme.error)))
          else if (provider.pets.isEmpty)
            Column(
              children: [
                _buildPlaceholderCard(theme),
                const SizedBox(height: 16),
                _buildPlaceholderCard(theme),
              ],
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.pets.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final pet = provider.pets[index];
                return Card(
                  elevation: 1, // Elevación suave estándar de Material 3
                  color: theme.colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer, // 🎨 Fondo suave de avatar M3
                      child: Icon(Icons.pets, color: theme.colorScheme.onPrimaryContainer), // 🎨 Ícono contrastante
                    ),
                    title: Text(
                      pet.name, 
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                    ),
                    subtitle: Text(
                      '${pet.breed ?? "Raza mixta"} • ${pet.age ?? 0} años',
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: theme.colorScheme.outline),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderCard(ThemeData theme) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}