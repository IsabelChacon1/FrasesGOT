import 'package:flutter/material.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:provider/provider.dart';
//import 'package:frases_got/screens/frases_random.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    //agregamos una variable
    final fraseProvider = Provider.of<FrasesProvider>(context);
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          color: const Color.fromARGB(255, 51, 28, 14),
          width: double.infinity,
          height: size.height * 0.30,
          alignment: Alignment.center,
          child: ListTile(
            title: const Text(
              'Frase random',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 252, 254, 240),
              ),
              textAlign: TextAlign.center,
              //icon: Icon(Icons.casino),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Frase', arguments: '');
            },
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 103, 51, 30),
          width: double.infinity,
          height: size.height * 0.29,
          alignment: Alignment.center,
          child: ListTile(
            title: const Text(
              'Casas',
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 252, 254, 240)),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'EscogeCasa',
                  arguments: 'EscogeCasa');
            },
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 185, 84, 12),
          width: double.infinity,
          height: size.height * 0.30,
          alignment: Alignment.center,
          child: ListTile(
            title: const Text(
              'Personajes',
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 252, 254, 240)),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              fraseProvider.getPersonaje();
              Navigator.pushNamed(context, 'EscogePers',
                  arguments: fraseProvider.personajes);
              print(fraseProvider.personajes);
            },
          ),
        ),
      ],
    );
  }
}
