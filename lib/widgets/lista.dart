import 'package:flutter/material.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:provider/provider.dart';
//import 'package:frases_got/screens/frases_random.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    //agregamos una variable
    final fraseProvider = Provider.of<FrasesProvider>(context);
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: size.width * 0.90,
            height: size.height * 0.20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/GOT_Logo.png'),
                    fit: BoxFit.contain)),
          ),
          const SizedBox(height: 50.0),
          Container(
            width: double.infinity,
            height: size.height * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 239, 150, 45),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
              ],
            ),
            child: ListTile(
              title: const Text(
                'Frase random',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 250, 244, 244),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                //frasesFavs.versSiyaEsFav();
                Navigator.pushNamed(context, 'Frase', arguments: '');
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            width: double.infinity,
            height: size.height * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 239, 150, 45),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
              ],
            ),
            child: ListTile(
              title: const Text(
                'Casas',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 250, 244, 244)),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.pushNamed(context, 'EscogeCasa',
                    arguments: 'EscogeCasa');
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            width: double.infinity,
            height: size.height * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 239, 150, 45),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
              ],
            ),
            child: ListTile(
              title: const Text(
                'Personajes',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 250, 244, 244),
                ),
                textAlign: TextAlign.center,
              ), //rgb(116, 142, 99)
              onTap: () {
                fraseProvider.getPersonaje();
                Navigator.pushNamed(context, 'EscogePers',
                    arguments: fraseProvider.personajes);
                //print(fraseProvider.personajes);
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            width: double.infinity,
            height: size.height * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 239, 150, 45),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
              ],
            ),
            child: ListTile(
              title: const Text(
                'Favoritas',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 250, 244, 244)),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.pushNamed(context, 'FrasesFavs', arguments: '');
                frasesFavs.performQuery();
                //print('$correoF ');
                //print('Frases encontradas: $frases');
              },
            ),
          ),
        ],
      ),
    );
  }
}
