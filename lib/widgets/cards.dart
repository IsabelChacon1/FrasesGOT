import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/frases_provider.dart';

class FrasesxPersonaje extends StatelessWidget {
  final String slugPersonaje;
  const FrasesxPersonaje({super.key, required this.slugPersonaje});

  @override
  Widget build(BuildContext context) {
    final fraseProvider = Provider.of<FrasesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              fraseProvider.getFrasePersonaje(slugPersonaje);
            },
            icon: const Icon(
              Icons.auto_awesome,
              size: 30,
              color: Color.fromARGB(255, 250, 244, 244),
            ),
          ),
        ],
        title: Center(
            child: Text(
          'Frase de: $slugPersonaje',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 244, 244),
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 239, 150, 45),
      ),
      body: const DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Frases_Wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: _FraseRandom(),
      ),
      floatingActionButton: Botoncito(),
    );
  }
}

class Botoncito extends StatefulWidget {
  const Botoncito({super.key});

  @override
  State<Botoncito> createState() => _BotoncitoState();
}

class _BotoncitoState extends State<Botoncito> {
  @override
  Widget build(BuildContext context) {
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    final fraseProvider = Provider.of<FrasesProvider>(context);
    frasesita = fraseProvider.fraseRandom;
    frasesFavs.versSiyaEsFav();
    return FloatingActionButton(
      onPressed: () {
        frasesita = fraseProvider.frasePers;
        setState(() {
          //myCondition = !myCondition;
          //frasesFavs.versSiyaEsFav();
        });
        //print("Agregar la frase ' $frasesita ' a favoritas");
        if (myCondition == false) {
          //no está guardada entonces guardala
          frasesFavs.guardarFrase();
        } else {
          //si está guardada entonces borrala
          frasesFavs.eliminarFrase();
        }

        //myCondition ? frasesFavs.guardarFrase() : frasesFavs.eliminarFrase();
        //LoginF_Provider().agregarFavorito;
      },
      //focusColor: myCondition ? Colors.green : Colors.red, // Cambiar el color según la condición
      backgroundColor: const Color.fromARGB(255, 239, 150, 45),

      child: Icon(
        myCondition ? Icons.heart_broken_rounded : Icons.favorite_rounded,
        color: const Color.fromARGB(255, 255, 255, 255),
        size: 40,
      ),
    );
  }
}

class _FraseRandom extends StatelessWidget {
  const _FraseRandom({super.key});

  @override
  Widget build(BuildContext context) {
    final fraseProvider = Provider.of<FrasesProvider>(context);

    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: size.width * 0.90,
        height: size.height * 0.40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(209, 90, 63, 17),
              Color.fromARGB(221, 156, 86, 24),
              Color.fromARGB(209, 239, 148, 45),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Text(
          fraseProvider.frasePers, //frase
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
        ),
      ),
    );
  }
}
