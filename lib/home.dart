import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/QuizPage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> images =[
    "images/download.png",
    "images/download.png",
    "images/download.png",
    "images/download.png",
    "images/download.png",
    
  ];

  Widget customcard(String name,String image){
    return Padding(padding: EdgeInsets.all(25.0),
    child: InkWell(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>GetData(name),
      ));
      },
      child:Material(
      color:Colors.cyanAccent,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          child: Column(
            children:[
              Padding(
                padding:EdgeInsets.symmetric(
                  vertical:10.0
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(100.0),
                  child:Container(
                    height: 200.0,
                    width: 200.0,
                    child:ClipOval(
                      child:Image(
                        fit: BoxFit.contain,
                        image:AssetImage(
                          image,
                        )
                      )
                    )
                  )
                ),
              ),
              Center(child: 
              Text(name,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontFamily: "Alike",
                fontWeight: FontWeight.w700,
              ),
              ),
              ),
              Container(
                padding:EdgeInsets.all(20.0),
                child:Text(
                  "This is a Quiz App",
                  style: TextStyle(
                    fontSize:20.0,
                    color: Colors.white,
                    fontFamily: "Satisfy",
                  ),
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Quiz App",
          style: TextStyle(
            fontFamily: "Quando"
          ),
        ),
      ),
      body: ListView(
        children: [
          customcard("Politics",images[0]),
          customcard("sports",images[1]),
          // customcard("International",images[2]),
          // customcard("Entertainment",images[3]),
          // customcard("General Knowledge",images[4]),
        ],
      ),
    );
  }
}