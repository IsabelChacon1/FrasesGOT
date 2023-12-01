import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';

class Escoger_Personaje extends StatelessWidget {
  List<Character> personajes;
  Escoger_Personaje({super.key, required this.personajes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Escoge un personaje')),
        backgroundColor: const Color.fromARGB(255, 195, 141, 95),
      ),
      body: personajes.isNotEmpty
          ? ListView.builder(
              itemCount: personajes.length,
              itemBuilder: (context, index) {
                final item = personajes[index];
                return ListTile(
                  title: Text(item.name),
                );
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
