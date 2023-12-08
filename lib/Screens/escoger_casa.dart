import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';
import 'package:frases_got/widgets/card_swiper.dart';

class Escoger_Casa extends StatelessWidget {
  List<House> casitas;
  Escoger_Casa({super.key, required this.casitas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 156, 85, 24),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
          elevation: 0,
          title: const Center(
              child: Text(
            'Escoge una casa',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 250, 244, 244),
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          )),
          backgroundColor: const Color.fromARGB(255, 239, 150, 45),
        ),
        body: CardSwiper(casitasGOT: casitas));
  }
}
