import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfitness/pages/details/details.dart';
import 'package:myfitness/pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
      initialRoute: '/details',
      home: null,
    );
  }
}
