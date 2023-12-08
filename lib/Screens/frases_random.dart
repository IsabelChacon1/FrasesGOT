import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class FrasesRandom extends StatefulWidget {
  const FrasesRandom({super.key});

  @override
  State<FrasesRandom> createState() => _FrasesRandomState();
}

class _FrasesRandomState extends State<FrasesRandom> {
  @override
  Widget build(BuildContext context) {
    final fraseProvider = Provider.of<FrasesProvider>(context);
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    frasesita = fraseProvider.fraseRandom;
    frasesFavs.versSiyaEsFav();

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              fraseProvider.getFraseRandom();
            },
            icon: const Icon(
              Icons.auto_awesome,
              size: 30,
              color: Color.fromARGB(255, 250, 244, 244),
            ),
          ),
        ],
        title: const Center(
            child: Text(
          'Frase random',
          style: TextStyle(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          frasesita = fraseProvider.fraseRandom;
          setState(() {});
          if (myCondition == false) {
            //no está guardada entonces guardala
            frasesFavs.guardarFrase();
            AlertDialog(
              title: Text('Agregamos la frase $frasesita a favoritos'),
            );
          } else {
            //si está guardada entonces borrala
            frasesFavs.eliminarFrase();
            AlertDialog(
              title: Text('Aliminamos la frase $frasesita favoritos'),
            );
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          fraseProvider.fraseRandom, //frase
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
