import 'package:flutter/material.dart';
import "dart:math";
void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firnum=0;
  int secondnum=0;
  String texttodisplay="";
  String res="";
  String op="";

  void btnclicked(String btntext){
    if(btntext=="C" || btntext=="AC"){
      texttodisplay="";
      firnum=0;
      secondnum=0;
      res="";
    }
    else if(btntext =="+"|| btntext =="-"||btntext =="/"||btntext =="x" || btntext=="%" || btntext=="^"){

      firnum=int.parse(texttodisplay);
      op=btntext;
      res="";
    }
    else if(btntext=="="){
      secondnum=int.parse(texttodisplay);
      if(op=="+"){
        res=(firnum+secondnum).toString();
      }
      if(op=="-"){
        res=(firnum-secondnum).toString();

      }
      if(op=="x"){
        res=(firnum*secondnum).toString();

      }
      if(op=="%"){
        res=(firnum%secondnum).toString();

      }
      if(op=="^"){
        res=(pow(firnum,secondnum)).toString();

      }
     if(op=="/"){
        res=(firnum~/secondnum).toString();

      }

    }
    else{
      res=int.parse(texttodisplay+btntext).toString();
    }
    setState(() {
      texttodisplay=res;
    });

  }
  Widget customButton(String btnval){
    return Expanded(
      child: ElevatedButton(

        //padding: EdgeInsets.all(25.0),
        onPressed: () =>btnclicked(btnval),
        child: Text(
            "$btnval",
            style:TextStyle(
              fontSize:40.0,
              fontWeight: FontWeight.w900,
              color: Colors.white70,
                  ),
                  ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(0.0),
            fixedSize: const Size(70,70),
            shape: const CircleBorder(),
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$texttodisplay",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ),
            ),

            Row(
              children: <Widget>[
                customButton("^"),
                customButton("%"),
                customButton("."),
                customButton("AC"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
