// Modifica tu lib/app.dart para que contenga la inicialización del CRUD de Pets:

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/theme/theme.dart';
import 'shared/theme/util.dart';
import 'core/network/api_client.dart';

// Autenticación
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/provider/login_provider.dart';
import 'features/auth/presentation/provider/register_provider.dart';
import 'features/auth/presentation/pages/login_page.dart';


import 'features/home/data/datasources/remote/pets_remote_datasource.dart';
import 'features/home/data/repositories/pet_repository_impl.dart';
import 'features/home/domain/usecases/create_pet_usecase.dart';
import 'features/home/domain/usecases/delete_pet_usecase.dart';
import 'features/home/domain/usecases/get_pets_usecase.dart';
import 'features/home/domain/usecases/update_pet_usecase.dart';
import 'features/home/presentation/provider/pets_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Poppins', 'Roboto');
    MaterialTheme materialTheme = MaterialTheme(textTheme);

    // 🏗️ INYECCIÓN MANUAL CENTRALIZADA (SINGLETON COMPARTIDO)
    final apiClient = ApiClient();

    // Slices de Auth
    final authRemoteDataSource = AuthRemoteDataSource(apiClient: apiClient);
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);
    final loginUseCase = LoginUseCase(authRepository);
    final registerUseCase = RegisterUseCase(authRepository);

    
    final petsRemoteDataSource = PetsRemoteDataSource(apiClient: apiClient);
    final petsRepository = PetRepositoryImpl(petsRemoteDataSource);
    final getPetsUseCase = GetPetsUseCase(petsRepository);
    final createPetUseCase = CreatePetUseCase(petsRepository);
    final updatePetUseCase = UpdatePetUseCase(petsRepository);
    final deletePetUseCase = DeletePetUseCase(petsRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider(loginUseCase)),
        ChangeNotifierProvider<RegisterProvider>(create: (_) => RegisterProvider(registerUseCase)),
        
        ChangeNotifierProvider<PetsProvider>(create: (_) => PetsProvider(getPetsUseCase, createPetUseCase, updatePetUseCase, deletePetUseCase)),
      ],
      child: MaterialApp(
        title: 'FiruliKE API Client',
        debugShowCheckedModeBanner: false,
        theme: materialTheme.light(),
        home: const LoginPage(), // O cambia temporalmente a HomePage() si deseas probarla directo sin logearte
      ),
    );
  }
}