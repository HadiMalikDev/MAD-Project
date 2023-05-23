// This code defines a MovieModel class with properties that correspond to movie details, and a factory method that parses JSON data into a MovieModel object.
class MovieModel {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  List<Map<String, dynamic>> ratings = [];
  String metaScore;
  String imdbRating;

  MovieModel(
      {this.actors,
      this.awards,
      this.country,
      this.director,
      this.genre,
      this.imdbRating,
      this.language,
      this.metaScore,
      this.plot,
      this.poster,
      this.rated,
      this.ratings,
      this.released,
      this.runtime,
      this.title,
      this.writer,
      this.year});

  factory MovieModel.fromJson(dynamic json) {
    if (json['Response'] == 'False') return null;
    return MovieModel(
      actors: json['Actors'],
      awards: json['Awards'],
      country: json['Country'],
      director: json['Director'],
      genre: json['Genre'],
      imdbRating: json['imdbRating'],
      language: json['Language'],
      metaScore: json['Metascore'],
      rated: json['Rated'],
      ratings: (json['Ratings'] as List)
          .map((e) => {'Source': e['Source'], 'Value': e['Value']})
          .toList(),
      released: json['Released'],
      runtime: json['Runtime'],
      writer: json['Writer'],
      title: json['Title'],
      year: json['Year'],
      plot: json['Plot'],
      poster: json['Poster'],
    );
  }
}
