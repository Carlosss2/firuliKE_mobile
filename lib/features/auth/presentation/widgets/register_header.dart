import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      color: theme.colorScheme.primary,
      padding: const EdgeInsets.only(left: 32, bottom: 30),
      alignment: Alignment.bottomLeft,
      child: Text(
        'Firulike\nComienza ya',
        style: theme.textTheme.headlineLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          height: 1.0,
        ),
      ),
    );
  }
}