import 'package:flutter/material.dart';
import "package:card_swiper/card_swiper.dart";
import 'package:frases_got/models/frase_response.dart';

class CardSwiper extends StatelessWidget {
  List<House> casitasGOT;

  CardSwiper({super.key, required this.casitasGOT});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //almacena tamaño de la pantalla
    return Swiper(
        itemCount: casitasGOT.length, //cuenta los datos que hay para mostrar
        layout: SwiperLayout.STACK, //FORMA EN QUE SE VEN LAS TARJETAS
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        itemBuilder: (_, int index) {
          final casitas = casitasGOT[index];
          return GestureDetector(
            onTap: () => {
              //todo abrir otra pantalla para que muestre los personajes de la casa y una fotito
              print('personajes de la casa ${casitas.slug}'),
              //Navigator.pushNamed(context, 'frases', arguments: casitas.slug)
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 90, 63, 17),
                              Color.fromARGB(255, 156, 86, 24),
                              Color.fromARGB(255, 239, 148, 45),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/${casitas.slug}.PNG'),
                          ),
                        ),
                        child: Text(
                          casitas.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 252, 254, 240),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                )
              ]),
            ),
          );
        } //del item builder
        ); //del swiper
  }
}
