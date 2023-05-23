import 'package:movies/models/movieModel.dart';
import 'package:movies/movieapi.dart';
// This code defines a searchForMovie method that retrieves movie details from the OMDb API based on a given movie name, and returns a MovieModel object parsed from the response.
class SearchPageModel {
  searchForMovie(String name) async {
    if (name == null) return null;
    var response = await MovieApi.getMovie(name);
    return MovieModel.fromJson(response);
  }
}
