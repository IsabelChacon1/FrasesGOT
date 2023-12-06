import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';

class FrasesRandom extends StatelessWidget {
  FrasesRandom({super.key});

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
                fraseProvider.getFraseRandom();
              },
              icon: const Icon(
                Icons.auto_awesome,
                size: 30,
                color: Color.fromARGB(255, 250, 244, 244),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_rounded),
              onPressed: () async {
                frasesita = fraseProvider.fraseRandom;

                print("Agregar la frase ' $frasesita ' a favoritas");

                //todo validar si no está ya la frase guardada con el correo
                //todo pintar el corazón de otro color cuando la frase esté guardada
                await Parse().initialize(keyApplicationId, keyParseServerUrl,
                    clientKey: keyClientKey, autoSendSessionId: true);
                print('Correo $correoF obtenido');
                var firstObject = ParseObject('frasesFavs')
                  ..set('frase', frasesita)
                  ..set('email', correoF);
                await firstObject.save();
                print('Frase guardada');
                //LoginF_Provider().agregarFavorito;
              },
            )
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
        ));
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
