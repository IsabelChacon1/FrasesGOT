import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';

class Escoger_Personaje extends StatelessWidget {
  List<Character> personajes;
  Escoger_Personaje({super.key, required this.personajes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 85, 24),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
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
                      print('Botón presionado');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 250, 244, 244),
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 250, 244, 244),
                          fontSize: 25,
                        ),
                      ),
                    ));
              },
            )
          : Center(child: Text('No se que pasa')),
    );
  }
}

// class ListViewMain extends StatelessWidget {
//   final List<MonstersResponse> monster;

//   const ListViewMain({super.key, required this.monster});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: monster.length,
//         itemBuilder: (context, index) {
//           final item = monster[index];
//           if (item.type == monstersResponseTypeValues.map['large']) {
//             return ListTile(
//               title: Text(item.name),
//               onTap: null,
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
