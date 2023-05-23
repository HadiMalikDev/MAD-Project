import 'package:flutter/material.dart';
import 'package:movies/screens/searchpage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F27),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Movie app".toUpperCase(),
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('images/popcorn.png'),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFD98639)),
                  ),
                  // This code defines a button press event handler that navigates to the SearchPage when the button is pressed.
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: Text("Search For Movies"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
