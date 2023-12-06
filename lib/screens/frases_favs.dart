import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class FrasesFavsScr extends StatefulWidget {
  const FrasesFavsScr({super.key});

  @override
  State<FrasesFavsScr> createState() => _FrasesFavsScrState();
}

class _FrasesFavsScrState extends State<FrasesFavsScr> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    //frasesFavs.performQuery();
    print(frases.length);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 85, 24),
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
        elevation: 0,
        title: const Center(
            child: Text(
          'Frases Favoritas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 244, 244),
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 239, 150, 45),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Frases_Wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: frases.isNotEmpty
            ? Swiper(
                itemCount:
                    frases.length, //cuenta los datos que hay para mostrar
                layout: SwiperLayout.STACK, //FORMA EN QUE SE VEN LAS TARJETAS
                itemWidth: size.width * 0.6,
                itemHeight: size.height * 0.4,
                itemBuilder: (_, int index) {
                  final fras = frases[index];
                  return GestureDetector(
                    onTap: () => {
                      //print('personajes de la casa ${casitas.slug}'),
                      //Navigator.pushNamed(context, 'frases', arguments: casitas.slug)
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(children: [
                        Center(
                          child: Container(
                            width: size.width * 0.7,
                            height: size.height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 90, 63, 17),
                                  Color.fromARGB(255, 156, 86, 24),
                                  Color.fromARGB(255, 239, 148, 45),
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              '$fras',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 252, 254, 240),
                              ),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        )
                      ]),
                    ),
                  );
                })
            : const Text('No hay frases para mostrar'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        //TODO comparar la frase de la card con la frase de la base de datos, importante considerar el correo y borrarla, preguntar si ta segur@
        print('Frases para eliminar: ${frasesFavs.frase}');
        icon:
        const Icon(
          Icons.heart_broken_rounded,
          color: Color.fromARGB(255, 250, 244, 244),
        );
      }),
    );
  }
}
