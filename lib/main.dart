import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/Theme/dark_theme.dart';
import 'core/Theme/light_theme.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/provider/auth_provider.dart';
import 'injection.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => sl<AuthProvider>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ticket',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const RegisterPage(),
      ),
    );
  }
}
