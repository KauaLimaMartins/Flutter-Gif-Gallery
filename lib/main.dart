import 'package:flutter/material.dart';

import './screens/home.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Colors.white,
        accentColor: Colors.white,
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
