import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';

class Escoger_Casa extends StatelessWidget {
  List<House> casitas;
  Escoger_Casa({super.key, required this.casitas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Escoge una casa')),
        backgroundColor: const Color.fromARGB(255, 195, 141, 95),
      ),
      body: casitas.isNotEmpty
          ? ListView.builder(
              itemCount: casitas.length,
              itemBuilder: (context, index) {
                final item = casitas[index];
                return ListTile(
                  title: Text(item.name),
                );
              },
            )
          : Center(child: Text('No se que pasa')),
    );
  }
}
