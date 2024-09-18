import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_fav_list/screens/favourite_movie_list.dart';
import 'package:provider_fav_list/providers/movie_provider.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {

    var favourites=context.watch<MovieProvider>().favList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies List",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) {

          bool isFavourite = favourites.contains(index);

          return ListTile(
            title: Text("Movie ${index+1}"),
            trailing:
            GestureDetector(
              onTap: () {
                _onFavoriteTapped(context, index, isFavourite);
              },
              child: Icon(
                Icons.favorite,
                color: isFavourite ? Colors.red : Colors.grey,
              ),
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () =>_navigateToFavouriteMovie(context),
      backgroundColor: Colors.blue,
        child: const Icon(Icons.favorite,color: Colors.white,)
      ),
    );
  }

  // Method to handle the favourite icon tap logic
  void _onFavoriteTapped(BuildContext context, int movieIndex, bool isFavourite) {
    var movieProvider = context.read<MovieProvider>();
    if (!isFavourite) {
      movieProvider.addToList(movieIndex);
    } else {
      movieProvider.removeFromList(movieIndex);
    }
  }

  void _navigateToFavouriteMovie(BuildContext context){
      var route=MaterialPageRoute(builder: (context) => const FavouriteMovies());
      Navigator.push(context,route);
  }
}
