import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';

class Escoger_Personaje extends StatelessWidget {
  List<Character> personajes;
  Escoger_Personaje({super.key, required this.personajes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Escoge un personaje')),
        backgroundColor: const Color.fromARGB(255, 195, 141, 95),
      ),
      body: personajes.isNotEmpty
          ? ListView.builder(
              itemCount: personajes.length,
              itemBuilder: (_, int index) {
                return ListTile(
                  title: Text('Item ${index + 1}'),
                );
              },
            )
          : Center(child: Text('No se que pasa')),
    );
  }
}
