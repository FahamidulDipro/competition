import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calc(),
    ),
  );
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String input = '0';
  String output = '0';

  showButton(String button) {
    setState(() {
      if (input == '0') {
        input = button;
      } else {
        input += button;
      }
    });
  }

  calculate() {
    Parser p = Parser();
    Expression expression = p.parse(input);
    ContextModel cm = ContextModel();
    setState(() {
      output = expression.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  calculatePercentage() {
    Parser p = Parser();
    Expression percentage = p.parse("${input}/100");
    ContextModel cm = ContextModel();
    setState(() {
      output = percentage.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  backButton() {
    setState(() {
      input = input.substring(0, input.length - 1);
      if (input == '') {
        input = '0';
      }
    });
  }

  Widget buildButton(String button) {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.white),
        padding: EdgeInsets.all(24),
        textColor: Colors.white,
        focusColor: Colors.green,
        child: Text(
          button,
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {
          showButton(button);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                child: Column(
                  children: [
                    Text(
                      input,
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Text(
                      output,
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Container(
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                        buildButton('/'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                        buildButton('*'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('1'),
                        buildButton('2'),
                        buildButton('3'),
                        buildButton('-'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('0'),
                        buildButton('00'),
                        buildButton('.'),
                        buildButton('+'),
//                        buildButton('%'),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.deepOrange[400],
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.white),
                              padding: EdgeInsets.all(24),
                              textColor: Colors.white,
                              child: Text(
                                'AC',
                                style: TextStyle(fontSize: 25),
                              ),
                              onPressed: () {
                                setState(() {
                                  input = '0';
                                  output = '0';
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.lightBlueAccent,
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.white),
                              padding: EdgeInsets.all(26),
                              textColor: Colors.white,
                              child: Icon(Icons.backspace),
                              onPressed: () {
                                setState(() {
                                  backButton();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.lightBlueAccent,
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.white),
                              padding: EdgeInsets.all(24),
                              textColor: Colors.white,
                              child: Text(
                                '%',
                                style: TextStyle(fontSize: 25),
                              ),
                              onPressed: () {
                                calculatePercentage();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.lightBlueAccent,
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.white),
                              padding: EdgeInsets.all(24),
                              textColor: Colors.white,
                              child: Text(
                                '=',
                                style: TextStyle(fontSize: 25),
                              ),
                              onPressed: () {
                                calculate();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
