import 'package:flutter/material.dart';

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  backgroundColor: const Color(0xFF333333),

  // Define the default font family.
  fontFamily: 'Roboto',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 18.0),
  ),
);
