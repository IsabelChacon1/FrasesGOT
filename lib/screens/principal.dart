import 'package:flutter/material.dart';
import 'package:frases_got/services/auth_services.dart';
import 'package:frases_got/widgets/lista.dart';
import 'package:provider/provider.dart';

class PrincipalScr extends StatelessWidget {
  const PrincipalScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(115, 255, 255, 255),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/GOT_Logo.png'),
                      fit: BoxFit.contain),
                  color: Colors.black),
              child: Text(
                'Holi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Bienvenido Usuario",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              onTap: () {
                Provider.of<AuthService>(context, listen: false).logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        // ],
        title: const Center(
            child: Text(
          'Frases de Game Of Thrones',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 195, 141, 95),
      ),
      body: Center(
        child: Lista(),
      ),
    );
  }
}
