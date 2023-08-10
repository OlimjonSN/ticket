import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket/core/routes/route.dart';
import 'package:ticket/features/events/presentation/provider/events_provider.dart';
import 'package:ticket/features/reservation/provider/reservation_provider.dart';

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
      providers: [ChangeNotifierProvider<AuthProvider>(create: (_) => sl<AuthProvider>()), ChangeNotifierProvider<EventsProvider>(create: (_) => sl<EventsProvider>()), ChangeNotifierProvider<ReservationProviderr>(create: (_) => sl<ReservationProviderr>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Ticket',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
        ),
        routerConfig: AppRoute.router,
      ),
    );
  }
}
