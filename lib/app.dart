import 'package:flutter/material.dart';
import 'shared/theme/theme.dart';
import 'shared/theme/util.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Poppins', 'Roboto');
    MaterialTheme materialTheme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Profile',
      theme: materialTheme.light(),
      //home: const ProfileScreen(),
    );
  }
}