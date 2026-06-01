import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/custom_header.dart';
import '../../../../shared/widgets/custom_navbar.dart';
import '../provider/pets_provider.dart';
import '../widgets/appointments_section.dart';
import '../widgets/pet_modal_helper.dart';
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
            CustomHeader(
              onSearchChanged: (query) {},
              onAddPressed: () => showPetFormModal(context, provider),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const AppointmentsSection(),
                    PetsListSection(provider: provider),
                  ],
                ),
              ),
            ),
            CustomNavbar(
              currentIndex: provider.currentNavbarIndex,
              onTabSelected: (index) {
                provider.setNavbarIndex(index);
              },
              onChatPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}