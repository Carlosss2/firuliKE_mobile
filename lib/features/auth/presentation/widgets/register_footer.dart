import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          child: Row(
            children: [
              Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
              const SizedBox(width: 32),
              Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Ya tienes cuenta? '),
            GestureDetector(
              onTap: () => Navigator.pop(context), // Regresa al Login de forma nativa
              child: Text(
                'Iniciar sesion',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}