import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:frases_got/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class Dismisible extends StatefulWidget {
  const Dismisible({super.key});

  @override
  State<Dismisible> createState() => _DismisibleState();
}

class _DismisibleState extends State<Dismisible> {
  //List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? fras;
    final frasesFavs = Provider.of<LoginF_Provider>(context);
    final fraseProvider = Provider.of<FrasesProvider>(context);
    frasesita = fraseProvider.fraseRandom;
    frasesFavs.versSiyaEsFav();
    return ListView.builder(
      itemCount: frases.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        fras = frases[index];
        return Dismissible(
          background: Container(
            color: Color.fromARGB(255, 94, 0, 0),
          ),
          key: ValueKey<int>(frases[index]!.length),
          onDismissed: (DismissDirection direction) {
            frasesita = frases[index]!;

            setState(() {
              frases.removeAt(index);
            });
            myCondition = true;
            frasesFavs.eliminarFrase();
          },
          child: ListTile(
            title: Text('$fras',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.amber)),
            onTap: () {
              print(frases[index]);
            },
          ),
        );
      },
    );
  }
}
