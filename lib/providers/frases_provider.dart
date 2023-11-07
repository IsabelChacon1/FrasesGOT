import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frases_got/models/models.dart';

class FrasesProvider extends ChangeNotifier {
  String _baseUrl = 'api.gameofthronesquotes.xyz';

  String casas = '';
  String personajes = '';
  String fraseRandom = '';
  List<House> casas_GOT = []; //Lista con las casas

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
    final Map<String, dynamic> decodeData = json.decode(response.body);

    final Casas = House.fromRawJson(response.body);
    casas = Casas.name;
    //TODO pasar el resultado a una lista y desplegar la lista en la pantalla de casas y que de ahí consulte los miembros de la casa y sus frases
    //casas_GOT = Casas;
    //le notificamos a los widgets que estan escuchando que se cambió la data por lo tanto se tiene que redibujar
    notifyListeners(); //Actualiza todo
    //print(frasesRandom.sentence.characters); //
  }

  getPersonaje() async {
    //aquí se llena la frase random
    var url = Uri.https(_baseUrl, '/v1/characters', {});
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);

    final Personaje = House.fromRawJson(response.body);
    personajes = Personaje.name;
    //TODO pasar el resultado a una lista y desplegar la lista en la pantalla de personajes y que de ahí consulte sus frases
    //le notificamos a los widgets que estan escuchando que se cambió la data por lo tanto se tiene que redibujar
    notifyListeners(); //Actualiza todo
    //print(frasesRandom.sentence.characters); //
  }
}
