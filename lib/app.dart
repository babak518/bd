import 'package:flutter/material.dart';
import 'ui/screens/home_screen.dart';

class BDApp extends StatelessWidget {
  const BDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BD Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
