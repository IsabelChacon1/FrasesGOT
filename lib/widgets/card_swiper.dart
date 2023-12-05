import 'package:flutter/material.dart';
import "package:card_swiper/card_swiper.dart";

//TODO agregar que se muestre la lista de personajes con su foto
class CardSwiper extends StatelessWidget {
  //Lista de datos
  List<Characters> personajesGot;
  CardSwiper({super.key, required this.personajesGot});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //almacena tamaño de la pantalla

    return SizedBox(
        width: double.infinity, //el contenedor toma el anocho de la pantalla
        height: size.height * 0.5, //el alto es la mitad de la pantalla
        child: Swiper(
            itemCount:
                personajesGot.length, //cuenta los datos que hay para mostrar
            layout: SwiperLayout.STACK, //FORMA EN QUE SE VEN LAS TARJETAS
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.4,
            itemBuilder: (_, int index) {
              final persona = personajesGot[index];
              //los print sirven para debug????
              //print(movie.posterPath); //donde está la imagen
              //print(movie.fullPosterImg); //la imagen?
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments:
                        persona), //hay que pasar los datos de la pelicula
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  // child: FadeInImage(
                  //   placeholder: AssetImage('assets/no-image.jpg'),
                  //   image: NetworkImage(
                  //       persona.fotito), //la imagen del personaje
                  // ),
                ), //HACE LOS BORDES REDONDEADOS
              );
            }));
  }
}
