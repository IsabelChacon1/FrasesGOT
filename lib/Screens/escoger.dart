import 'package:flutter/material.dart';

class Escoger extends StatelessWidget {
  const Escoger({super.key});

  @override
  Widget build(BuildContext context) {
    //colocamos la instancia de MoviesProvider
    //final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_outlined)),
            ],
            title: const Center(child: Text('Peliculas en cine'))),
        body: Column(
          children: [
            // CardSwiper(
            //movies: moviesProvider.onDisplayMovies,
            //     ),
            // MovieSlider(
            // movies: moviesProvider.popularMovies,
            //     ),
          ],
        ));
  }
}
