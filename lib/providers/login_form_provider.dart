import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginF_Provider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  List<String> frase = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    correoF = email;
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());
    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }

  Future<List<String>> getMessagesFromEmail() async {
    final headers = {
      'X-Parse-Application-Id': keyApplicationId,
      'X-Parse-REST-API-Key': keyClientKey,
      'Content-Type': keyParseServerUrl,
    };
    final params = {
      'where': jsonEncode({'email': correoF})
    };
    final response = await http.get(
      Uri.parse('$keyParseServerUrl/parse/classes/frasesFavs')
          .replace(queryParameters: params),
      headers: headers,
    );
    return frase = jsonDecode(response.body)['results'];
    //regresa nulo sepa porque
  }

  // Future<void> agregarFavorito() async {
  //   await Parse().initialize(keyApplicationId, keyParseServerUrl,
  //       clientKey: keyClientKey, autoSendSessionId: true);
  //   print('Correo obtenido $email');
  //   var firstObject = ParseObject('frasesFavs')
  //     ..set('frase', frase)
  //     ..set('email', email);
  //   await firstObject.save();
  //   print('Frase guardada');
  // }

  // Future<List<String>> obtenerFavoritos() async {
  //   await Parse().initialize(keyApplicationId, keyParseServerUrl,
  //       clientKey: keyClientKey, autoSendSessionId: true);
  //   print('Correo $correoF obtenido');
  //   var firstObject = ParseObject('frasesFavs')..get('frase');
  //    ..get('email', correoF);
  //   await firstObject.save();

  // final queryBuilder = QueryBuilder(ParseObject('frasesFavs'))
  //   ..whereEqualTo('email', correoF);

  // final response = await queryBuilder.query();

  // if (response.success) {
  //   return response.results!
  //       .map((favorito) => Favorito(
  //             email: favorito.correoF,
  //             frase: favorito.get('frase'),
  //           ))
  //       .toList();
  // } else {
  //   throw response;
  // }
  //}

  // Future<void> eliminarFavorito(String objectId) async {
  //   final favoritoTable = ParseObject('frasesFavs')..objectId = objectId;
  //   await favoritoTable.delete();
  // }
}
