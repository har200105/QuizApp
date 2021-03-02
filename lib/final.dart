import 'package:flutter/material.dart';
import 'package:quiz/home.dart';


class Finalpage extends StatefulWidget {
  int marks=0;
  Finalpage({Key key,this.marks}):super(key: key);
  @override
  _FinalpageState createState() => _FinalpageState(marks);
}

class _FinalpageState extends State<Finalpage> {

  List<String> images=[
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message=" ";
  String image=" ";
  int marks=0;
  _FinalpageState(this.marks);
  @override
  void initState() {
    super.initState();
    if(marks<3){
      image=images[2];
      message="You should try again , You scored $marks";
    }else if(marks<4){
      image=images[1];
      message="Tried well,You Scored $marks";
    }else{
      image=images[0];
      message="Well Played,You Scored $marks";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Score",
        ),
      ),
      body: Column(
        children:[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                child:Column(
                  children: [
                   Material(
                     child: Container(
                       width: 300.0,
                       height: 300.0,
                        child:ClipRect(
                  child:Image(
                    image:AssetImage(
                     image,
                    ),
                  ),
                ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(
                       vertical:5.0,
                       horizontal:15.0,
                     ),
                     child:Center(
                     child:Text(
                       message,
                       style: TextStyle(
                         fontSize: 20.0,
                       ),
                     ),
                   ),
                   )
                  ],
                )
              ),
            ),
          ),
           Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context)=>Homepage(),
                  ));
                },
                child:Text(
                  "Next",
                  style: TextStyle(
                    fontSize:18.0,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical:10.0,
                  horizontal:25.0,
                ),
                borderSide: BorderSide(width: 2.0,color: Colors.deepPurpleAccent),
                splashColor: Colors.orangeAccent,
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}