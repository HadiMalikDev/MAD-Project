import 'dart:convert';

import 'package:http/http.dart' as http;

const String _apiKey = "6a0297f1";

// This code defines a static function that sends a GET request to the OMDb API with a movie name and API key, and returns the response body as a JSON object.
class MovieApi {
  static getMovie(String name) async {
    http.Response response = await http.get(Uri.http(
        'omdbapi.com', '', {'apikey': _apiKey, 't': name, 'plot': 'full'}));
    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else
      return null;
  }
}
