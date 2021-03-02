import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/final.dart';

class GetData extends StatelessWidget {

  String quizname;
  GetData(this.quizname);
  String assettoload;

  setdata(){
    if(quizname=="Politics"){
      assettoload = "assets/politics.json";
    }else{
      assettoload = "assets/sports.json";
    }
  }
  @override
  Widget build(BuildContext context) {
    

    setdata();

      return FutureBuilder(builder:(context,snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata==null){
          return Scaffold(body: Center(
            child:Text("Loading"),
          ),
          );
        }else{
          return QuizPage(mydata:mydata);
        }
      } ,
      future:DefaultAssetBundle.of(context).loadString(assettoload,cache: false) ,
      );
  }
}

class QuizPage extends StatefulWidget {

  var mydata;

  QuizPage({Key key ,@required this.mydata}):super(key:key);

  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  var mydata ;
  int i=1;
  int timer=10;
  int marks=0;
  String showtimer = "10";
  _QuizPageState(this.mydata);
    Color colorts = Colors.purpleAccent;
    Color right = Colors.green;
    Color wrong = Colors.red;

    Map<String,Color>bcolor={
      "a" : Colors.purpleAccent,
      "b" : Colors.purpleAccent,
      "c" : Colors.purpleAccent,
      "d" : Colors.purpleAccent
  };

  bool canceltimer = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

   @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
 
  void startTimer()async{
    const d = Duration(seconds: 1);
    Timer.periodic(d, (Timer t) {
      setState(() {
        if(timer<1){
          t.cancel();
          nextques();
        }else if(canceltimer){
          t.cancel();
        }
        else{
          timer--;
        }
        showtimer=timer.toString();
      });
     });
  }

  void nextques(){
    canceltimer=false;
    timer=10;
    setState(() {
      if(i<8){
      i++;
    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Finalpage(marks:marks)));
    }
    bcolor["a"]=Colors.purple;
    bcolor["b"]=Colors.purple;
    bcolor["c"]=Colors.purple;
    bcolor["d"]=Colors.purple;
    });
    startTimer();
  }

    void checkanswer(String key){
      if(mydata[2][i.toString()]==mydata[1][i.toString()][key]){
        marks+=1;
        colorts=right;
      }else{
        colorts=wrong;
      }
      setState(() {
        bcolor[key]=colorts;
        canceltimer=true;
      });

      Timer(Duration(seconds: 2),nextques);
        
    }
    

 Widget optionbutton(String option){
  
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:10.0,
        horizontal:20.0,
      ),
      child: MaterialButton(
        onPressed:()=>checkanswer(option),
        child: Text(
          mydata[1][i.toString()][option],style: TextStyle(
            color:Colors.white,
            fontFamily:"Quando",
            fontSize:15.0,
          ),
            maxLines: 1,
        ),
        color: bcolor[option],
        splashColor: Colors.purple[700],
        highlightColor: Colors.purple[700],
        minWidth: 200.0,
        height: 40.0,
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0))
      )
    );
  }



  @override
  Widget build(BuildContext context) {
        // int i=1;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    return WillPopScope(onWillPop: (){
      return showDialog(context: context, builder:(context)=> AlertDialog(
        title: Text(
          "Quiz App"
        ),
        content: Text(
          "You cannot leave the game in middle"
        ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text(
            "Ok"
          ))
        ],
      ));
    },child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(mydata[0][i.toString()],style: TextStyle(fontSize:25.0,fontFamily:"Satisfy"),),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                 optionbutton('a'),
                 optionbutton('b'),
                 optionbutton('c'),
                 optionbutton('d'),
               ]
             ),
            ),
          ),
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     decoration:BoxDecoration(
          //       color:Colors.teal,
          //     )
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
             child: Text(
               showtimer,
               style: TextStyle(
                 fontSize:30.0,
                 fontWeight:FontWeight.w800,
               ),
             ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}