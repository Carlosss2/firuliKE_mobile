import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../provider/login_provider.dart';
import '../../../../core/router/app_router.dart';

class LoginForm extends StatelessWidget {
  final LoginProvider provider;
  const LoginForm({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inicio de sesion',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          
          // Input Correo
          _buildCardTextField(
            theme: theme,
            controller: provider.emailController,
            hintText: 'Correo electronico',
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          
          // Input Contraseña
          _buildCardTextField(
            theme: theme,
            controller: provider.passwordController,
            hintText: 'Contraseña',
            icon: Icons.lock_outline,
            obscureText: true,
          ),
          const SizedBox(height: 32),

          if (provider.errorMessage != null) ...[
            Text(
              provider.errorMessage!,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
            ),
            const SizedBox(height: 16),
          ],

          // Botón de Login
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: provider.isLoading 
                ? null 
                : () async {
                    final success = await provider.login();
                    
                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('¡Login Exitoso!')),
                      );

                      context.go(AppRouter.home);
                    }
                  },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: provider.isLoading
                ? CircularProgressIndicator(color: theme.colorScheme.onPrimary)
                : Text('Inicio de sesion', style: theme.textTheme.titleMedium?.copyWith(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardTextField({
    required ThemeData theme,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Card(
      elevation: 4,
      shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.26),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}