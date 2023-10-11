import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //para quitar la parte que dice debug
        title: 'Frases de Game Of Thrones',
        initialRoute: 'home',
        routes: {
          'home': (_) => Inicio(),
          'Frase': (_) => FraseRandom(),
          'Escoge': (_) => Escoge(),
          ''
        });
  }
}
