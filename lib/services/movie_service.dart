import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  static const String apiKey = '8c32ac22';
  static const String baseUrl = 'http://www.omdbapi.com/';

  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await http.get(
      Uri.parse('$baseUrl?apikey=$apiKey&s=$query&type=movie'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['Response'] == 'True') {
        final List<dynamic> results = data['Search'];
        List<Movie> movies = [];
        
        for (var result in results) {
          final detailResponse = await http.get(
            Uri.parse('$baseUrl?apikey=$apiKey&i=${result['imdbID']}'),
          );
          
          if (detailResponse.statusCode == 200) {
            final detailData = json.decode(detailResponse.body);
            movies.add(Movie.fromJson(detailData));
          }
        }
        return movies;
      }
    }
    return [];
  }
}