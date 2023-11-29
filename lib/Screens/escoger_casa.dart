import 'package:flutter/material.dart';

class Escoger_Casa extends StatelessWidget {
  const Escoger_Casa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(child: Text('Escoge una casa')),
          backgroundColor: const Color.fromARGB(255, 195, 141, 95),
          actions: [
            IconButton(
              focusColor: Colors.black,
              onPressed: () {
                // fraseProvider.getFraseRandom();
              },
              icon: const Icon(
                Icons.ac_unit,
                size: 30,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            //TODO CAMBIAR LOS COLORES
            //poner la lista para escoger una casa y luego pasar a escoger un personaje de esa casa
            ListTile(
              title: const Text(
                'House Stark of Winterfell',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: const Color.fromARGB(255, 188, 219, 235),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'stark');
                //mandarla a lista de personajes con la variable del nombre de la casa
                //
              },
            ),
            ListTile(
              title: const Text(
                'House Lannister of Casterly Rock',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 145, 117, 33),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'lannister');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Baratheon of Dragonstone',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 192, 175, 125),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'Baratheon');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                "House Targaryen of King's Landing",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 187, 187, 187),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'Targaryen');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Greyjoy of Pyke',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 65, 65, 65),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'Greyjoy');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Tarly of Horn Hill',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 239, 173, 255),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'Tarly');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Tarth of Evenfall Hall',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 174, 162, 243),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'tarth');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Bolton of the Dreadfort',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: const Color.fromARGB(255, 0, 0, 0),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'bolton');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Baelish of Harrenhal',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 7, 53, 83),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'baelish');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
            ListTile(
              title: const Text(
                'House Tyrell of Highgarden',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
                //icon: Icon(Icons.casino),
              ),
              tileColor: Color.fromARGB(255, 22, 70, 36),
              onTap: () {
                // Navigator.pushNamed(context, '',
                //     arguments:
                //         slug:'tyrell');
                //mandarla a lista de personajes con la variable del nombre de la casa
              },
            ),
          ],
        ));
  }
}
