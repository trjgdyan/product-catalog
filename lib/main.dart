import 'package:flutter/material.dart';
// import 'login.dart';
// import 'register.dart';
import 'main_layout.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gedog App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/dashboard': (context) => const MainLayout(initialIndex: 0),
        '/favorite': (context) => const MainLayout(initialIndex: 1),
        '/account': (context) => const MainLayout(initialIndex: 2),
      },
    );
  }
}
