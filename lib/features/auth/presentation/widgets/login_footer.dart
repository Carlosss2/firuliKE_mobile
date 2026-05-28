import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
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
            const Text('¿No tienes cuenta? '),
            GestureDetector(
              onTap: () {
                // Navegación 1.0 solicitada por tu profesor
                // Navigator.pushNamed(context, '/register'); 
              },
              child: Text(
                'Registrarme',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}