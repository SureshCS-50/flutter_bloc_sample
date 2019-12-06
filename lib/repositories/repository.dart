import 'dart:async';
import 'package:bloc_pattern_sample/network_providers/movie_api_provider.dart';
import 'package:bloc_pattern_sample/models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}