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
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 90, 63, 17),
              Color.fromARGB(255, 156, 85, 24),
              Color.fromARGB(255, 239, 150, 45),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/GOT_Logo.png'),
                      fit: BoxFit.contain)),
              child: const Text(""),
            ),
            const ListTile(
              leading: Icon(
                Icons.people,
                color: Color.fromARGB(255, 250, 244, 244),
              ),
              title: Text(
                "Bienvenido Usuario",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 250, 244, 244),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.output,
                color: Color.fromARGB(255, 250, 244, 244),
              ),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 250, 244, 244),
                ),
              ),
              onTap: () {
                Provider.of<AuthService>(context, listen: false).logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      )),
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 250, 244, 244)),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'FrasesFavs', arguments: '');
              },
              icon: const Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 250, 244, 244),
              )),
        ],
        title: const Center(
            child: Text(
          'Frases de Game Of Thrones',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 244, 244),
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 239, 150, 45),
      ),
      backgroundColor: const Color.fromARGB(255, 156, 85, 24),
      body: const Center(
        child: Lista(),
      ),
    );
  }
}
