import 'package:flutter/material.dart';

class FrasesRandom extends StatelessWidget {
  const FrasesRandom({super.key});

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
          'Frase random',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 195, 141, 95),
      ),
      body: const _FraseRandom(),
    );
  }
}

class _FraseRandom extends StatelessWidget {
  const _FraseRandom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        child: const Text(
          '"Inserte frase aquí"',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
        ),
        width: size.width * 0.80,
        height: size.height * 0.50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 78, 36, 11),
            image: DecorationImage(
                image: AssetImage('assets/Iron_Throne.jpg'), fit: BoxFit.cover)

            // image: DecorationImage('')
            ),
      ),
    );
  }
}
