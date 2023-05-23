import 'package:flutter/material.dart';
import 'package:movies/models/movieModel.dart';
import 'package:movies/models/searchpagemodel.dart';
import 'package:movies/screens/moviepage.dart';

class SearchPage extends StatelessWidget {
  SearchPageModel _model = SearchPageModel();
  @override
  Widget build(BuildContext context) {
    String name;
    return Scaffold(
      backgroundColor: Color(0xFF1E1F27),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/glasses.png'),
                Text(
                  "Want Ratings? \n We got em",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  onChanged: (val) => name = val,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20,
                    ),
                    contentPadding: EdgeInsets.all(2),
                    filled: true,
                    fillColor: Color.fromARGB(204, 105, 105, 105),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Search for a movie',
                    labelStyle: TextStyle(
                        color: Colors.white70, fontSize: 16, height: 0),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFD98639)),
                  ),
                  // This code defines a button press event handler that searches for a movie based on user input, displays an error message if the search is unsuccessful, and navigates to a new page displaying the movie details if the search is successful.
                  onPressed: () async {
                    MovieModel model = await _model.searchForMovie(name);
                    if (model == null) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: Color.fromRGBO(90, 90, 92, 1),
                                title: Text(
                                  "An error occured. Please enter a valid movie name",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFD98639)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: Text("Okay"),
                                  )
                                ],
                              ),
                          barrierDismissible: false);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MoviePage(
                            movie: model,
                          ),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Search"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
