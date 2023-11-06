import "package:card_swiper/card_swiper.dart";
import "package:flutter/material.dart";
import "package:frases_got/models/models.dart";
import 'package:provider/provider.dart';
import 'package:frases_got/providers/frases_provider.dart';

class CardSwiper extends StatelessWidget {
  //final Map<String, dynamic> random;
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //almacena tamaño de la pantalla
    final fraseProvider = Provider.of<FrasesProvider>(context);
    return SizedBox(
        width: double.infinity, //el contenedor toma el anocho de la pantalla
        height: size.height * 0.5, //el alto es la mitad de la pantalla
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK, //FORMA EN QUE SE VEN LAS TARJETAS
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            //final frase = fraseProvider.fraseRandom;
            return GestureDetector(
              //onTap: () => Navigator.pushNamed(context, '', arguments: frase),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/Iron_Throne.jpg'),
                  image: AssetImage('assets/Iron_Throne.jpg'),
                ),
              ), //HACE LOS BORDES REDONDEADOS
            );
          },
        ));
  }
}
