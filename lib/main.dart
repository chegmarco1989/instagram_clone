import 'package:flutter/material.dart';
import './home.dart';

void main() => runApp(InstagramClone());

class InstagramClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        primaryTextTheme: TextTheme(
          title: TextStyle(
              color: Colors.black, fontFamily: 'Billabong', fontSize: 30.0),
        ),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black),
        ),
      ),
      home: Home(),
    );
  }
}
