import 'package:flutter/material.dart';
import 'package:frases_got/widgets/lista.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        ],
        title: const Center(child: Text('Frases de Game Of Thrones')),
        backgroundColor: Color.fromARGB(255, 122, 82, 35),
      ),
      body: Lista(),
    );
  }
}
