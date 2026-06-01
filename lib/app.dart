import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/theme/theme.dart';
import 'shared/theme/util.dart';
import 'core/di/app_container.dart';
import 'features/auth/di/auth_di.dart';
import 'features/home/di/home_di.dart';
import 'features/auth/presentation/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Poppins', 'Roboto');
    MaterialTheme materialTheme = MaterialTheme(textTheme);

    final appContainer = AppContainer();
    final authDI = AuthDI(appContainer);
    final homeDI = HomeDI(appContainer);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authDI.loginProvider),
        ChangeNotifierProvider.value(value: authDI.registerProvider),
        ChangeNotifierProvider.value(value: homeDI.petsProvider),
      ],
      child: MaterialApp(
        title: 'FiruliKE',
        debugShowCheckedModeBanner: false,
        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        themeMode: ThemeMode.system,
        home: const LoginPage(),
      ),
    );
  }
}
