import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String displaytxt;
  late String result;
  late String operand;
  late String history;
  late double num1;
  late double num2;

  @override
  void initState() {
    super.initState();
    displaytxt = '0';
    result = '0';
    operand = '';
    history = '';
    num1 = 0.0;
    num2 = 0.0;
  }

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      displaytxt = '0';
      result = '0';
      operand = '';
      history = '';
      num1 = 0.0;
      num2 = 0.0;
    } else if (btnVal == '+' || btnVal == '-' || btnVal == '*' || btnVal == '/') {
      num1 = double.parse(result);
      operand = btnVal;
      history += ' $result $btnVal';
      result = '0';
    } else if (btnVal == '=') {
      num2 = double.parse(result);
      if (operand == '+') {
        result = (num1 + num2).toString();
      } else if (operand == '-') {
        result = (num1 - num2).toString();
      } else if (operand == '*') {
        result = (num1 * num2).toString();
      } else if (operand == '/') {
        result = (num1 / num2).toString();
      }
      history += ' $num2 = $result';
      operand = '';
    } else if (btnVal == '+/-') {
      result = (double.parse(result) * -1).toString();
    } else if (btnVal == '%') {
      result = (double.parse(result) / 100).toString();
    } else {
      if (result == '0') {
        result = btnVal;
      } else {
        result += btnVal;
      }
    }
    setState(() {
      displaytxt = result;
    });
  }

  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () => btnOnClick(btnTxt),
        child: Text(
          btnTxt,
          style: TextStyle(
            fontSize: 30,
            color: txtColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Display calculation history
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                history,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white60,
                ),
              ),
            ),
            // Display output
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                displaytxt,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
            // Calculator buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('C', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.orange, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('7', Colors.grey[850]!, Colors.white),
                calcButton('8', Colors.grey[850]!, Colors.white),
                calcButton('9', Colors.grey[850]!, Colors.white),
                calcButton('*', Colors.orange, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('4', Colors.grey[850]!, Colors.white),
                calcButton('5', Colors.grey[850]!, Colors.white),
                calcButton('6', Colors.grey[850]!, Colors.white),
                calcButton('-', Colors.orange, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('1', Colors.grey[850]!, Colors.white),
                calcButton('2', Colors.grey[850]!, Colors.white),
                calcButton('3', Colors.grey[850]!, Colors.white),
                calcButton('+', Colors.orange, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               calcButton('  ', Colors.black87, Colors.black87),
                calcButton('0', Colors.grey[850]!, Colors.white),
                calcButton('.', Colors.grey[850]!, Colors.white),
                calcButton('=', Colors.orange, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
