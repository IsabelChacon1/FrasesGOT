import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
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
          iconTheme: IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
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
            IconButton(
              icon: const Icon(Icons.favorite_rounded),
              onPressed: () async {
                frasesita = fraseProvider.frasePers;

                print("Agregar la frase ' $frasesita ' a favoritas");
                //todo guardar el texto del contenedor

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
          title: Center(
              child: Text(
            'Frase de: $slugPersonaje',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 250, 244, 244),
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          )),
          backgroundColor: const Color.fromARGB(255, 239, 150, 45),
        ),
        body: DecoratedBox(
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.90,
        height: size.height * 0.40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
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
