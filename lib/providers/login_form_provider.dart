import 'package:flutter/material.dart';
import 'package:frases_got/main.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginF_Provider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String? frase = '';

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

  void performQuery() async {
    var queryBuilder = QueryBuilder<ParseObject>(ParseObject('frasesFavs'));
    queryBuilder.whereEqualTo('email', correoF);
    final ParseResponse apiResponse = await queryBuilder.query();
    frases.clear();
    if (apiResponse.success && apiResponse.result != null) {
      for (var object in apiResponse.result as List<ParseObject>) {
        // Puedes acceder a los datos del objeto
        frase = object.get<String>('frase');
        frases.add(frase);
        print(object.get<String>('frase'));
      }
    } else {
      // Manejo de errores
      print("Error retrieving data");
    }
  }
  //todo crear metodo para borrar las frases
  //todo crear metodo para que verifique si ya está guardada la frase
}
