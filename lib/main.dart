import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  buttonPressed(String text){
    if(text=="CLEAR"){
       _output="0";
       num1=0.0;
       num2=0.0;
       operand="";
    }
    else if(text=="+" || text=="-" || text=="X" || text=="/"){
      operand=text;
      num1=double.parse(output);
      _output="0";
    }
    else if(text=="."){
      if(_output.contains(".")){
        print("Already contains a decimal dot");
        return;
      }
      else
        _output=_output+text;
    }
    else if(text=="="){
      num2=double.parse(output);
      if(operand=="+")
        _output=(num1+num2).toString();
      else if(operand=="-")
        _output=(num1-num2).toString();
      else if(operand=="X")
        _output=(num1*num2).toString();
      else if(operand=="/")
        _output=(num1/num2).toString();

      num1=num2=0.0;
      operand="";
    }
    else
      _output=_output+text;

    print(_output);
    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }

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
        onPressed: ()=>buttonPressed(text),
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

