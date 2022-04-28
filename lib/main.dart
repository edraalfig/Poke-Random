import 'package:flutter/material.dart';
import 'package:poke_random/pages/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Prueba 1',
      initialRoute: 'inicio',
      routes: {'inicio': (_) => const LoginPage()},
    );
  }
}
