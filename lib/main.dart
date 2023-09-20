import 'package:chatpp/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Roboto ",
        appBarTheme: AppBarTheme(
             color: Colors.black, iconTheme: IconThemeData(color: Colors.white)),
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.black,
      ),
      home: HomeScreen(),
    );
  }
}
