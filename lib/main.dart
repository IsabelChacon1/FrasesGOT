import 'package:flutter/material.dart';
import 'package:frases_got/Screens/escoger_personaje.dart';
import 'package:frases_got/screens/inicio.dart';
import 'package:frases_got/screens/escoger_casa.dart';
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
          'EscogeCasa': (_) => Escoger_Casa(),
          'EscogePers': (_) => Escoger_Personaje(),
          //para escoger casas o presonajes y luego escoger personajes de la casa
        });
  }
}
