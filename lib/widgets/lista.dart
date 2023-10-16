import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          child: const Text(
            'Frase random',
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 252, 254, 240)),
            textAlign: TextAlign.center,
          ),
          color: const Color.fromARGB(255, 51, 28, 14),
          width: double.infinity,
          height: size.height * 0.30,
          alignment: Alignment.center,
          // onTap: () {
          //   //cuando oprimes el boton
          //   Navigator.push(
          //     //Abre una pagina Nueva
          //     context,
          //     MaterialPageRoute(
          //         //ruta horizontal(es la q abre rutas en flutter)
          //         //constructor, funcion anonima que toma el context(estado actual) clase
          //         builder: (context) =>
          //             const SingleChildScrollViewExampleWidget()),
          //   );
          // },
        ),
        Container(
          child: const Text(
            'Casas',
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 252, 254, 240)),
            textAlign: TextAlign.center,
          ),
          color: const Color.fromARGB(255, 103, 51, 30),
          width: double.infinity,
          height: size.height * 0.29,
          alignment: Alignment.center,
        ),
        Container(
          child: const Text(
            'Personajes',
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 252, 254, 240)),
            textAlign: TextAlign.center,
          ),
          color: const Color.fromARGB(255, 185, 84, 12),
          width: double.infinity,
          height: size.height * 0.30,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
