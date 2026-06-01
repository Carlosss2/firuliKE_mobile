import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/register_provider.dart';
import '../widgets/register_header.dart';
import '../widgets/register_form.dart';
import '../widgets/register_footer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<RegisterProvider>();
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegisterHeader(),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    RegisterForm(provider: provider),
                    const RegisterFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
