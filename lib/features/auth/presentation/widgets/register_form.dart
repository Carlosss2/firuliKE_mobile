import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/register_provider.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RegisterProvider>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registrate',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          
          _buildCardTextField(
            controller: provider.emailController,
            hintText: 'Correo electronico',
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          
          _buildCardTextField(
            controller: provider.passwordController,
            hintText: 'Contraseña',
            icon: Icons.lock_outline,
            obscureText: true,
          ),
          const SizedBox(height: 16),

          _buildCardTextField(
            controller: provider.confirmPasswordController,
            hintText: 'Confirmar contraseña',
            icon: Icons.lock_reset_outlined,
            obscureText: true,
          ),
          const SizedBox(height: 24),

          if (provider.errorMessage != null) ...[
            Text(
              provider.errorMessage!,
              style: TextStyle(color: theme.colorScheme.error, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
          ],

          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: provider.isLoading 
                ? null 
                : () async {
                    final success = await provider.register();
                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('¡Usuario creado correctamente! Inicia sesión.')),
                      );
                      Navigator.pop(context); // Regresa al Login usando Navegación 1.0
                    }
                  },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: provider.isLoading
                ? CircularProgressIndicator(color: theme.colorScheme.onPrimary)
                : const Text('Registrarme', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
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