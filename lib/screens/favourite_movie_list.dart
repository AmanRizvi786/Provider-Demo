import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class FavouriteMovies extends StatelessWidget {
  const FavouriteMovies({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favourite Movies",style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text("Movies ${fav[index]+1}"),
          trailing: TextButton(
              onPressed: () {
                context.read<MovieProvider>().removeFromList(fav[index]);
              },
              child: const Text("Remove",style: TextStyle(color: Colors.red))),
        );
      },
      ),
    );
  }
}
