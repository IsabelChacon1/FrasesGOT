import 'package:flutter/material.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:provider/provider.dart';
import 'package:frases_got/Screens/escoger_personaje.dart';
import 'package:frases_got/screens/inicio.dart';
import 'package:frases_got/screens/escoger_casa.dart';
import 'package:frases_got/screens/frases_random.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Lista de providers que se van a tener
        ChangeNotifierProvider(
          //avisa que hay un provider
          create: (_) => FrasesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final primaryColor = const Color.fromARGB(255, 147, 119, 238);

  @override
  Widget build(BuildContext context) {
    final frasesProv = Provider.of<FrasesProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false, //para quitar la parte que dice debug
        title: 'Frases de Game Of Thrones',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        initialRoute: 'home',
        routes: {
          'home': (_) => const Inicio(),
          'Frase': (_) => const FrasesRandom(),
          'EscogeCasa': (_) => const Escoger_Casa(),
          'EscogePers': (_) =>
              Escoger_Personaje(personajes: frasesProv.personajes),
          //para escoger casas o presonajes y luego escoger personajes de la casa
        });
  }
}
