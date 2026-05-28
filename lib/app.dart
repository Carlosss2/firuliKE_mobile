import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shared/theme/theme.dart';
import 'shared/theme/util.dart';
import 'core/network/api_client.dart';
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/provider/login_provider.dart';
import 'features/auth/presentation/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Poppins', 'Roboto');
    MaterialTheme materialTheme = MaterialTheme(textTheme);

    final apiClient = ApiClient();
    final authRemoteDataSource = AuthRemoteDataSource(apiClient: apiClient);
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);

    final loginUseCase = LoginUseCase(authRepository);

  
    return MultiProvider(
      providers: [
        // Proveedor del ViewModel para el Login, inyectándole su respectivo caso de uso
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(loginUseCase),
        ),
        
      ],
      child: MaterialApp(
        title: 'FiruliKE API Client',
        debugShowCheckedModeBanner: false,
        theme: materialTheme.light(),
        home: const LoginPage(), 
      ),
    );
  }
}