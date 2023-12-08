import 'package:flutter/material.dart';
import 'package:frases_got/models/personajes_resp.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Personajes extends ChangeNotifier {
  Personajes() {
    getPers();
  }

  getPers() async {
    Parse().initialize(
      'ycdF0zyXJGzM76ueCjPekx7BkRmAK3xvfi0Az7Jd',
      'JPa3OwmSchmElBlKvYjukkWGnGnIxWXN9z8tWWBk',
      liveQueryUrl: 'https://parseapi.back4app.com',
    );

    // Realizar una consulta en la base de datos
    var obj = ParseObject('personajes');
    try {
      List<Fotito> personajeFotito = await obj.get('fotito');
      personajeFotito.forEach((element) {
        print(element);
      });
    } catch (e) {
      print(e);
    }
  }
}
