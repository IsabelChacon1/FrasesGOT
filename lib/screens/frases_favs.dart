import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:frases_got/widgets/dismisible.dart';
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
    String? fras;
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    //frasesFavs.performQuery();
    //TODO IMPRIME LA FRASE QUE ESTÁS VIENDO PARA BORRARLA SI LE PICAS AL BOTÓN
    //print(frasesFavs.frase);
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
            ? Dismisible()
            : Center(
                child: Text(
                  'No hay frases para mostrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),
              ),
      ),
      //floatingActionButton: Botoncito(),
    );
  }
}
