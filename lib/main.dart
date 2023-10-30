import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/loading.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/loading": (context) => const Loading(),
      },
    ),
  );
}
