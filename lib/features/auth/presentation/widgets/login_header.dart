import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: theme.colorScheme.primary, // Usa el color del MaterialTheme
      padding: const EdgeInsets.only(left: 32, bottom: 40),
      alignment: Alignment.bottomLeft,
      child: Text(
        'Bienvenido\nDe nuevo',
        style: theme.textTheme.headlineLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
      ),
    );
  }
}