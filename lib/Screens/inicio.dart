import 'package:flutter/material.dart';
import 'package:frases_got/widgets/lista.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        // ],
        title: const Center(
            child: Text(
          'Frases de Game Of Thrones',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 195, 141, 95),
      ),
      body: const Lista(),
    );
  }
}
