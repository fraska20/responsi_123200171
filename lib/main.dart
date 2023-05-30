import 'package:flutter/material.dart';
import 'package:responsi_123200171/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
