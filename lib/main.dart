import 'package:flutter/material.dart';
import 'package:ticket/core/Theme/light_theme.dart';

import 'package:ticket/welcome_page.dart';

import 'core/Theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const WelcomPage(),
    );
  }
}
