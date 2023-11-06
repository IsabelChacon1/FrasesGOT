import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frases_got/models/models.dart';

class FrasesProvider extends ChangeNotifier {
  String _baseUrl = 'api.gameofthronesquotes.xyz';

  String casas = ''; //Lista con las casas
  String personajes = ''; //lista con personajes
  String fraseRandom = '';
  //Map<String, dynamic> fraseRandom = {}; //frases random
  //Map<int, List<Cast>> movieCast = {};

  FrasesProvider() {
    getFraseRandom();
    //getCasas();
    //getMoviesCast();
  }

  getFraseRandom() async {
    //aquí se llena la frase random
    var url = Uri.https(_baseUrl, '/v1/random', {});
    final response = await http.get(url);
    final frasRand = Random.fromRawJson(response.body);
    final frase = frasRand.sentence;
    final autor = frasRand.character.name;
    fraseRandom = '"$frase" -$autor';
    //fraseRandom = {frasRand.sentence, frasRand.character}
    //le notificamos a los widgets que estan escuchando que se cambió la data por lo tanto se tiene que redibujar
    notifyListeners(); //Actualiza todo
    //print(frasesRandom.sentence.characters); //
  }

  getCasas() async {
    //aquí se llena la frase random
    var url = Uri.https(_baseUrl, '/v1/houses', {});

    final response = await http.get(url);
    final Casas = House.fromRawJson(response.body);
    casas = Casas.name;
    //le notificamos a los widgets que estan escuchando que se cambió la data por lo tanto se tiene que redibujar
    notifyListeners(); //Actualiza todo
    //print(frasesRandom.sentence.characters); //
  }
}
