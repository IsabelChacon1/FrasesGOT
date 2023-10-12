import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Frase random',
                  style: TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Align(Alignment.center,
                          child: Divider(color: Colors.blueGrey))))
            ],
          ),
          color: const Color.fromARGB(255, 197, 163, 253),
          width: double.infinity,
          height: size.height * 0.35,
        ),
        const ListTile(
          title: Text('Casas',
              style: TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 144, 77, 189))),
        ),
        const ListTile(
          title: Text('Personajes',
              style: TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 144, 77, 189))),
        ),
      ],
    );
  }
}
