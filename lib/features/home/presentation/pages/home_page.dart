import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/components/custom_header.dart';
import '../../../../shared/components/custom_navbar.dart';
import '../provider/pets_provider.dart';
import '../widgets/appointments_section.dart';
import '../widgets/pets_list_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Disparamos la lectura remota de AWS NestJS inmediatamente al construir el home
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PetsProvider>().loadPets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<PetsProvider>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Usamos nuestro componente extraído en shared/components
            CustomHeader(
              onSearchChanged: (query) {
                // Lógica futura de filtrado
              },
              onAddPressed: () {
                // Navegación nativa 1.0 para crear una mascota
              },
            ),
            
            // Cuerpo deslizable
            const Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AppointmentsSection(),
                    PetsListSection(),
                  ],
                ),
              ),
            ),
            
            // Barra de navegación personalizada extraída en shared/components
            CustomNavbar(
              currentIndex: provider.currentNavbarIndex,
              onTabSelected: (index) {
                provider.setNavbarIndex(index);
              },
              onChatPressed: () {
                // Acción para levantar soporte técnico o chat
              },
            ),
          ],
        ),
      ),
    );
  }
}