import 'package:flutter/material.dart';

class Escoger_Casa extends StatelessWidget {
  const Escoger_Casa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(child: Text('Escoge una casa')),
          backgroundColor: const Color.fromARGB(255, 195, 141, 95),
        ),
        body: Column(
          children: [
            //poner la lista para escoger una casa y luego pasar a escoger un personaje de esa casa
          ],
        ));
  }
}