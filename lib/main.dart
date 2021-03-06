import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        primaryColorLight: Colors.grey,
        accentColor: Colors.blue,
      ),
      home: MyHomePage(title: 'Claculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonValue) {
    if (buttonValue == "Clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "/" ||
        buttonValue == "x") {
      num1 = double.parse(output);
      operand = buttonValue;
      _output = "0";
    } else if (buttonValue == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
      } else {
        _output = _output + buttonValue;
      }
    } else if (buttonValue == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonValue;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttontext) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttontext,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttontext),
        color: Colors.grey,
        textColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 132,
                horizontal: 12,
              ),
              child: new Text(output,
                  style: new TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            new Expanded(
              child: new Divider(),
            ),
            Column(
              children: [
                new Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                new Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x")
                  ],
                ),
                new Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                new Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ],
                ),
                new Row(
                  children: [
                    buildButton("<--"),
                    buildButton("Clear"),
                    buildButton("="),
                    //buildButton("")
                  ],
                ),
              ],
            )
          ],
        )));
  }
}
