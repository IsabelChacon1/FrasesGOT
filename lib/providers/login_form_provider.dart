import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginF_Provider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String? frase = '';
  String? frasesEnFavs = '';
  var queryBuilder;
  var apiResponse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    correoF = email;
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    //print(formKey.currentState?.validate());
    //print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }

  void guardarFrase() async {
    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);
    var firstObject = ParseObject('frasesFavs')
      ..set('frase', frasesita)
      ..set('email', correoF);
    await firstObject.save();
    //   print("Agregar la frase ' $frasesita ' a favoritas");
    //   print('frase guardada');
  }

  void performQuery() async {
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
    );

    var queryBuilder = QueryBuilder<ParseObject>(ParseObject('frasesFavs'));
    queryBuilder.whereEqualTo('email', correoF);
    final ParseResponse apiResponse = await queryBuilder.query();
    frases.clear();
    if (apiResponse.success && apiResponse.result != null) {
      for (var object in apiResponse.result as List<ParseObject>) {
        // Puedes acceder a los datos del objeto
        frase = object.get<String>('frase');
        frases.add(frase);
        //print(object.get<String>('frase'));
      }
    } else {
      // Manejo de errores
      //print("Error retrieving data");
    }
    notifyListeners();
  }

  //  metodo para que verifique si ya está guardada la frase
  void versSiyaEsFav() async {
    //print('Estamos viendo si está la frase y mi condición es $myCondition');
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
    );
    queryBuilder = QueryBuilder<ParseObject>(ParseObject('frasesFavs'));
    queryBuilder..whereEqualTo('email', correoF);
    apiResponse = await queryBuilder.query();
    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        // Puedes acceder a los datos del objeto
        frasesEnFavs = object.get<String>('frase');
        if (frasesEnFavs == frasesita) {
          //frasesId.add(fraseId);

          // print(object);
          // print('frase en favsssss: $frasesEnFavs');
          // print('frase para comparar $frasesita');
          // print('frase coincide');
          myCondition = true; //si está la frase
          frasesEnFavs = frasesita;
          // return true;
        }
        // else {
        //   myCondition = false;
        //   print('frase NO coincideeee');
        //   print('frase en favs: $frasesEnFavs');
        //   print('frase para comparar $frasesita');
        //}
      }
    } else {
      // Manejo de errores
      // myCondition = false; //no ta la frase
      // print("Error retrieving data");
      // print(apiResponse.error);
      // print(queryBuilder.queries);
      //return false;
    }
    notifyListeners();
  }

  // metodo para borrar las frases
  void eliminarFrase() async {
    try {
      //versSiyaEsFav(); // Ejecuta la consulta
      // print(
      //   'Estamos viendo si está la frase pa borrarla y mi condición es $myCondition');
      if (myCondition == true) {
        //si está la frase has todo eso
        // ParseObject frasePaBorrar = frasesita as ParseObject;
        //ParseObject phraseToDelete = apiResponse.results!.first;
        List<ParseObject> phraseToDelete =
            apiResponse.results as List<ParseObject>;
        for (ParseObject frasePaBorrar in phraseToDelete) {
          if (frasePaBorrar.get<String>('frase') == frasesita) {
            // print(frasesEnFavs);
            //print(frasesita);
            //print(frasePaBorrar);
            // Si hay coincidencia, elimina ese objeto
            final ParseResponse deleteResponse = await frasePaBorrar.delete();
            //print('Frase eliminada: ${frasePaBorrar.objectId}');
            if (deleteResponse.success) {
              // print('Frase eliminada: $frasesita');
              //print('La frase fue eliminada correctamente. $frasesita');
              myCondition = false; //frase estaba y ya no está
            } else {
              //   // Manejo de errores de eliminación
              //print(
              //  'No se pudo eliminar la frase: ${deleteResponse.error?.message}');
            }
          }

          // ParseObject phraseToDelete = apiResponse.results!.first;
        }
      } else {
        //si no ta la frase deme un error
        // Manejo de errores de consulta
        // print('Error de consulta: ${apiResponse.error?.message}, ');
        //print(apiResponse.toString());
      }
    } on Exception catch (e) {
      //print('Error al realizar la consulta: $e');
    }
    notifyListeners();
  }
}
