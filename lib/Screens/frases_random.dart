import 'package:flutter/material.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';

class FrasesRandom extends StatelessWidget {
  //final String email;
  FrasesRandom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fraseProvider = Provider.of<FrasesProvider>(context);
    final keyApplicationId = 'ycdF0zyXJGzM76ueCjPekx7BkRmAK3xvfi0Az7Jd';
    final keyClientKey = 'JPa3OwmSchmElBlKvYjukkWGnGnIxWXN9z8tWWBk';
    final keyParseServerUrl = 'https://parseapi.back4app.com';
    String email = "";
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
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
              icon: const Icon(Icons.favorite_border),
              onPressed: () async {
                print("Agregar la frase a favoritas");
                //todo guardar el texto del contenedor
                await Parse().initialize(keyApplicationId, keyParseServerUrl,
                    clientKey: keyClientKey, autoSendSessionId: true);
                var SecondObject = ParseObject('Login')..get('email');
                print('Correo obtenido $SecondObject');
                var firstObject = ParseObject('FrasesFavs')
                  ..set('frase', fraseProvider.fraseRandom)
                  ..set('email', SecondObject);
                await firstObject.save();
                print('Frase guardada');
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
