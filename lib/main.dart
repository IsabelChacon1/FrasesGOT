import 'package:flutter/material.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';
import 'package:frases_got/Screens/screens.dart';

import 'providers/login_form_provider.dart';
import 'services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'ycdF0zyXJGzM76ueCjPekx7BkRmAK3xvfi0Az7Jd';
  final keyClientKey = 'JPa3OwmSchmElBlKvYjukkWGnGnIxWXN9z8tWWBk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  // await Parse().initialize(keyApplicationId, keyParseServerUrl,
  //     clientKey: keyClientKey, autoSendSessionId: true);
  // var firstObject = ParseObject('FirstClass')
  //   ..set(
  //       'message', 'Hey ! First message from Flutter. Parse is now connected');
  // await firstObject.save();
  // print('done');
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Lista de providers que se van a tener
        ChangeNotifierProvider(
          //avisa que hay un provider
          create: (_) => FrasesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LoginF_Provider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final primaryColor = const Color.fromARGB(255, 147, 119, 238);

  @override
  Widget build(BuildContext context) {
    final frasesProv = Provider.of<FrasesProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false, //para quitar la parte que dice debug
        title: 'Frases de Game Of Thrones',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        initialRoute: 'checking',
        routes: {
          'login': (_) => LoginPage(),
          'register': (_) => RegistroPage(),
          'checking': (_) => CheckAuthScreen(),
          'home': (_) => const PrincipalScr(),
          'Frase': (_) => const FrasesRandom(),
          'EscogeCasa': (_) => Escoger_Casa(casitas: frasesProv.casas_GOT),
          'EscogePers': (_) =>
              Escoger_Personaje(personajes: frasesProv.personajes),
          //para escoger casas o presonajes y luego escoger personajes de la casa
        });
  }
}
