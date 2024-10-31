import 'package:flutter/material.dart';
import 'package:qutoes_application/quotes.dart';
import 'package:qutoes_application/hover_text.dart'; // replace 'your_app_name' with your actual app name
import 'dart:math';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text(
            'Quotify',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat', // replace with your custom font
              color: Colors.black, // changed text color to black
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 10.0, // reduced elevation for a more subtle shadow
        ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex % 3, // Ensure currentIndex is within the range of the items list
          onTap: (index) {
            setState(() {
              if (index == 0) {
                if (_currentIndex > 0) {
                  _currentIndex--;
                }
              } else if (index == 1) {
                _currentIndex = _random.nextInt(quotesList.length);
              } else if (index == 2) {
                if (_currentIndex < quotesList.length - 1) {
                  _currentIndex++;
                }
              }
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_left_sharp),
              label: 'Previous',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp),
              label: 'Random',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_right_sharp),
              label: 'Next',
            ),
          ],
        ),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(

                  padding: EdgeInsets.all(20), // increased padding for better readability
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4), // thicker border
                    borderRadius: BorderRadius.circular(20), // increased radius for a more rounded corner
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [Colors.yellow,Colors.redAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),// added a white background color
                    boxShadow: [ // added a box shadow for a 3D effect
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset: Offset(0, 10), // shadow offset
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '"${quotesList[_currentIndex][kQuote]}"', // quote enclosed in "
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic, // added italic font style
                          color: Colors.black, // changed text color to indigo
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20), // increased spacing between quote and author
                      Text(
                        '- ${quotesList[_currentIndex][kAuthor]}', // author's name
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // changed text color to black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}