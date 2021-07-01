import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:movieapp/screens/movie/movies/popular_movie.dart';
import 'package:movieapp/screens/movie/movies/poster_movie.dart';
import 'package:movieapp/screens/movie/movies/upcoming_movie.dart';
import 'package:movieapp/style/theme.dart' as Style;

import 'movies/best_movies.dart';
import 'genre/genres.dart';
import 'others/now_playing.dart';
import 'others/persons.dart';

class Movie_Screen extends StatefulWidget {
  @override
  _Movie_ScreenState createState() => _Movie_ScreenState();
}

class _Movie_ScreenState extends State<Movie_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        children: <Widget>[
          PosterMovieScreen(),
          GenresScreen(),
          BestMovies(),
          NowPlaying(),
          MoviePopularScreen(),
          UpcomingMovieScreen(),
          PersonsList(),
        ],
      ),
    );
  }
}
