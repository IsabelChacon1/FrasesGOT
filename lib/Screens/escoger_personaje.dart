import 'package:flutter/material.dart';

class Escoger_Personaje extends StatelessWidget {
  const Escoger_Personaje({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(child: Text('Escoge un personaje')),
          backgroundColor: const Color.fromARGB(255, 195, 141, 95),
        ),
        body: Column(
          children: [
//poner la lista para escoger un personaje
          ],
        ));
  }
}
