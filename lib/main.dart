import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      title: "Calc +",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String output="0";

  Widget buildButton(String text){
    return new Expanded(
      child: new OutlineButton(
        child:new Text(text,
          style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.all(24.0),
        onPressed: ()=>{},
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calc +"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              alignment:Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0
              ),
                child: new Text(
                    output,
                  style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

            ),
            new Expanded(
              child: new Divider(),
            ),
            new Column(
              children: <Widget>[
              new Row(
                children:<Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                 ]
               ),
                new Row(
                    children:<Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X")
                    ]
                ),
                new Row(
                    children:<Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("+")
                    ]
                ),
                new Row(
                    children:<Widget>[
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("."),
                      buildButton("-")
                    ]
                ),
                new Row(
                    children:<Widget>[
                      buildButton("CLEAR"),
                      buildButton("="),
                    ]
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}

