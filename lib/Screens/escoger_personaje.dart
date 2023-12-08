import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:frases_got/widgets/cards.dart';
import 'package:provider/provider.dart';

class Escoger_Personaje extends StatelessWidget {
  List<Character> personajes;
  Escoger_Personaje({super.key, required this.personajes});

  @override
  Widget build(BuildContext context) {
    final fraseProvider = Provider.of<FrasesProvider>(context);
    String slugPers;
    //todo mostrar una foto del personaje en la lista
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 85, 24),
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
        elevation: 0,
        title: const Center(
            child: Text(
          'Escoge un personaje',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 244, 244),
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 239, 150, 45),
      ),
      body: personajes.isNotEmpty
          ? ListView.builder(
              itemCount: personajes.length,
              itemBuilder: (context, index) {
                final item = personajes[index];
                return InkWell(
                    onTap: () {
                      //print('Botón presionado');
                      //print(personajes[index].slug);
                      slugPers = personajes[index].slug.toString();
                      fraseProvider.getFrasePersonaje(slugPers);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FrasesxPersonaje(
                                    slugPersonaje: slugPers,
                                  )));
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 250, 244, 244),
                      ),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 250, 244, 244),
                          fontSize: 25,
                        ),
                      ),
                    ));
              },
            )
          : const Center(child: Text('No se que pasa')),
      //CardSwiper(personajesGot: personajes)
    );
  }
}
