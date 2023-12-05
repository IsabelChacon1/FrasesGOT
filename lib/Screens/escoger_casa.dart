import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';

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
      body: casitas.isNotEmpty
          ? ListView.builder(
              itemCount: casitas.length,
              itemBuilder: (context, index) {
                final item = casitas[index];
                return InkWell(
                    onTap: () {
                      print('Botón presionado');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 250, 244, 244),
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 250, 244, 244),
                          fontSize: 25,
                        ),
                      ),
                    ));
              },
            )
          : Center(child: Text('No se que pasa')),
    );
  }
}
