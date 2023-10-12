import 'package:flutter/material.dart';
import 'package:frases_got/screens/inicio.dart';
import 'package:frases_got/screens/escoger.dart';
import 'package:frases_got/screens/frases_random.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final primaryColor = Color.fromARGB(255, 147, 119, 238);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //para quitar la parte que dice debug
        title: 'Frases de Game Of Thrones',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        initialRoute: 'home',
        routes: {
          'home': (_) => Inicio(),
          'Frase': (_) => FrasesRandom(),
          'Escoge': (_) =>
              Escoger(), //para escoger casas o presonajes y luego escoger personajes de la casa
        });
  }
}
