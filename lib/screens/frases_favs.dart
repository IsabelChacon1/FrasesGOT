import 'package:flutter/material.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class FrasesFavsScr extends StatelessWidget {
  FrasesFavsScr({super.key});

  @override
  Widget build(BuildContext context) {
    //final fraseProvider = Provider.of<FrasesProvider>(context);
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 156, 85, 24),
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
          elevation: 0,
          title: const Center(
              child: Text(
            'Frases Favoritas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 250, 244, 244),
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          )),
          backgroundColor: const Color.fromARGB(255, 239, 150, 45),
        ),
        body: ListView.builder(
          itemCount: frasesFavs.frase.length,
          itemBuilder: (context, index) {
            final item = frasesFavs.frase[index];
            return InkWell(
                onTap: () {
                  print('Botón presionado');
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 250, 244, 244),
                  ),
                  title: Text(
                    item.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 250, 244, 244),
                      fontSize: 25,
                    ),
                  ),
                ));
          },
        ));
  }
}
