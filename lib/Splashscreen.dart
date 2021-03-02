import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
      Homepage(),
      )
      );
    } 
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.purple,
      body:Center(
        child: Text(
          "Quiz App",
          style: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
          fontFamily: "Satisfy",
          ),
        ),  
      )
    );
  }
}