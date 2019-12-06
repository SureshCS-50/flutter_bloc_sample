import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:bloc_pattern_sample/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<ItemModel> fetchMovieList() async {
    final url = "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey";
    print("Url: $url");
    
    final response = await client .get(url);
    print("Response: ${response.body.toString()}");
    
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}