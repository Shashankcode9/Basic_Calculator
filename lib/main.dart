import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Basic Calculator'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String p = "0";
  bool f = true;
  String output = "0";
  String prev = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      prev = "0";
      f = true;

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
      prev = prev +" "+operand+" ";
      f = false;

    } else if(buttonText == "."){
      prev = prev+".";
      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }
      f = false;

    } else if (buttonText == "="){

      num2 = double.parse(output);
      f = false;

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {
      if(f == true){
        _output = buttonText;
        prev = buttonText;
      }else {
        _output = _output + buttonText;
        prev = prev + buttonText;
      }

    }

    print(_output);
    print(prev);
    String show = "0";
    setState(() {

     output = double.parse(_output).toStringAsFixed(2);

    });
    setState(() {

      p = prev;

    });




  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new TextButton(
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget buildButton1(String buttonText) {
    return new Expanded(
      child: new TextButton(
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.amber
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
        appBar: new AppBar(
          backgroundColor: Colors.amber,
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: new Text(output, style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ))),
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: new Text(p, style: new TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white

                    ))),
                new Expanded(
                  child: new Divider(),
                ),


                new Column(children: [
                  new Row(children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton1("/")
                  ]),
                  SizedBox(height: 15,),

                  new Row(children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton1("X")
                  ]),
                  SizedBox(height: 15,),
                  new Row(children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton1("-")
                  ]),
                  SizedBox(height: 15,),
                  new Row(children: [
                    buildButton1("."),
                    buildButton1("0"),
                    buildButton1("00"),
                    buildButton1("+")
                  ]),
                  SizedBox(height: 15,),
                  new Row(children: [
                    buildButton1("CLEAR"),
                    buildButton1("="),
                  ])
                ])
              ],
            )));
  }
}
