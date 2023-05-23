import 'package:flutter/material.dart';
import 'package:movies/models/movieModel.dart';

/* 
This code defines a StatelessWidget called MoviePage, which displays detailed information about a movie. It receives a MovieModel object as a parameter and displays its properties using a CustomScrollView widget that contains two Sliver widgets: a SliverAppBar and a SliverList.

The SliverAppBar displays the movie poster as its background and is pinned to the top of the screen. It also has a flexibleSpace property that allows it to stretch as the user scrolls down.

The SliverList contains several containers that display information about the movie, including its title, plot, people involved, details, ratings, and other metadata.

The code also defines two helper methods: getColumn and getRow. getColumn returns a Column widget with a title and text, where the text can have multiple lines separated by commas. It conditionally displays the text based on its length. getRow returns a Row widget with a title and text, where the text can have multiple lines separated by commas.
*/
class MoviePage extends StatelessWidget {
  MovieModel movie;
  MoviePage({this.movie});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF1E1F27),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              stretch: true,
              centerTitle: true,
              expandedHeight: size.height * 0.6,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "${movie.poster}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  getColumn(title: 'Plot', text: "${movie.plot}"),
                  getColumn(title: 'People involved', text: ''),
                  getRow(title: 'Director:', text: "${movie.director}"),
                  getRow(title: 'Writer(s):', text: "${movie.writer}"),
                  getRow(title: 'Actor(s):', text: "${movie.actors}"),
                  getColumn(title: 'Details', text: ''),
                  getRow(title: 'Year:', text: "${movie.year}"),
                  getRow(title: 'Genre:', text: "${movie.genre}"),
                  getRow(title: 'Rated:', text: "${movie.rated}"),
                  getRow(title: 'Language(s):', text: "${movie.language}"),
                  getRow(title: 'Country:', text: "${movie.country}"),
                  getRow(title: 'Award(s):', text: "${movie.awards}"),
                  getColumn(title: 'Ratings', text: ''),
                  for (var item in movie.ratings)
                    getRow(
                      title: '${item['Source']}',
                      text: '${item['Value']}',
                    ),
                  getRow(title: 'Metascore:', text: "${movie.metaScore}"),
                  getRow(title: 'IMDB Rating:', text: "${movie.imdbRating}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // This code defines a getColumn method that returns a column widget with a title and text, where the text can have multiple lines separated by commas, and it conditionally displays the text based on its length.
  getColumn({String title, String text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$title",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          if (text?.length > 0)
            SizedBox(
              height: 15,
            ),
          if (text?.length > 0)
            Text(
              "$text",
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
            )
        ],
      ),
    );
  }

  // This code defines a getRow method that returns a row widget with a title and text, where the text can have multiple lines separated by commas.
  getRow({String title, String text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                "$title",
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${text.split(",").join("\n")}",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
