import 'package:flutter/material.dart';

class Escoger extends StatelessWidget {
  const Escoger({super.key});

  @override
  Widget build(BuildContext context) {
    //colocamos la instancia de MoviesProvider
    //final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        //Poner una condición de si es escoger casa o escoger personaje

        body: Column(
      children: [],
    ));
  }
}

class _Escoger_Casa extends StatelessWidget {
  const _Escoger_Casa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(child: Text('Escoge una casa')),
          backgroundColor: const Color.fromARGB(255, 195, 141, 95),
        ),
        body: Column(
          children: [
            //poner la lista para escoger una casa y luego pasar a escoger un personaje de esa casa
          ],
        ));
  }
}

class _Escoger_Personaje extends StatelessWidget {
  const _Escoger_Personaje({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(child: Text('Escoge un personaje')),
          backgroundColor: const Color.fromARGB(255, 195, 141, 95),
        ),
        body: Column(
          children: [
//poner la lista para escoger un personaje
          ],
        ));
  }
}
