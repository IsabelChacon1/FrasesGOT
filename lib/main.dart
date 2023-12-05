import 'package:flutter/material.dart';
import 'package:frases_got/providers/frases_provider.dart';
import 'package:frases_got/screens/frases_favs.dart';
import 'package:provider/provider.dart';
import 'package:frases_got/Screens/screens.dart';
import 'providers/login_form_provider.dart';
import 'services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          'Frase': (_) => FrasesRandom(),
          'EscogeCasa': (_) => Escoger_Casa(casitas: frasesProv.casas_GOT),
          'EscogePers': (_) =>
              Escoger_Personaje(personajes: frasesProv.personajes),
          'FrasesFavs': (_) => FrasesFavsScr(),

          //para escoger casas o presonajes y luego escoger personajes de la casa
        });
  }
}
