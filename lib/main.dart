import 'package:flutter/material.dart';
import 'package:quiz/Splashscreen.dart';

void main(){
  runApp(Quizapp());
}


class Quizapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}