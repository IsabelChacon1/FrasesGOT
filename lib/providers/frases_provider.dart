import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frases_got/models/frase_response.dart';
import 'package:http/http.dart' as http;

class FrasesProvider extends ChangeNotifier {
  String _baseUrl = 'api.gameofthronesquotes.xyz';

  String casas = '';
  String personajeSlug = '';
  String frasePers = '';
  String fraseRandom = '';
  List<House> casas_GOT = []; //Lista con las casas
  List<Character> personajes = []; //lista de personajes

  //Map<String, dynamic> fraseRandom = {}; //frases random
  //Map<int, List<Cast>> movieCast = {};

  FrasesProvider() {
    getFraseRandom();
    getCasas();
    //getMoviesCast();
    getPersonaje();
    getFrasePersonaje(personajeSlug);
  }

  getFraseRandom() async {
    //aquí se llena la frase random
    var url = Uri.https(_baseUrl, '/v1/random', {});
    final response = await http.get(url);
    final frasRand = RandomFrase.fromRawJson(response.body);
    final frase = frasRand.sentence;
    final autor = frasRand.character.name;
    fraseRandom = '"$frase" -$autor';
    //fraseRandom = {frasRand.sentence, frasRand.character}
    //le notificamos a los widgets que estan escuchando que se cambió la data por lo tanto se tiene que redibujar
    notifyListeners(); //Actualiza todo
    //print(frasesRandom.sentence.characters); //
  }

  getCasas() async {
    var url = Uri.https(_baseUrl, '/v1/houses', {});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      casas_GOT = data.map((item) => House.fromJson(item)).toList();
    }
    notifyListeners();
  }

  getPersonaje() async {
    //aquí se llena la frase random
    var url = Uri.https(_baseUrl, '/v1/characters', {});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      personajes = data.map((item) => Character.fromJson(item)).toList();
    }
    notifyListeners();
  }

  getFrasePersonaje(personajeSlug) async {
    //https://api.gameofthronesquotes.xyz/v1/author/sansa
    var url = Uri.https(_baseUrl, '/v1/author/$personajeSlug', {});
    final response = await http.get(url);
    final frasRand = RandomFrase.fromRawJson(response.body);
    final frase = frasRand.sentence;
    final autor = frasRand.character.name;
    frasePers = '"$frase" -$autor';
    //fraseRandom = {frasRand.sentence, frasRand.character}
    //le notificamos a los widgets que estan escuchando que se cambió la data por lo tanto se tiene que redibujar
    notifyListeners(); //Actualiza todo
    //print(frasesRandom.sentence.characters); //
  }
}
