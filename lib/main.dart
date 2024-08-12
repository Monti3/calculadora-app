import 'package:calculadora_app/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';
  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 24, color: Colors.grey)),
                  )),
            ),
            Container(
              alignment: const Alignment(1, 1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                      textStyle:
                          const TextStyle(fontSize: 48, color: Colors.white)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  callback: allClear,
                  text: 'AC',
                  textSize: 20,
                ),
                CalcButton(callback: clear, text: 'C'),
                CalcButton(callback: numClick, text: '%'),
                CalcButton(callback: numClick, text: '/')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(callback: numClick, text: '7'),
                CalcButton(callback: numClick, text: '8'),
                CalcButton(callback: numClick, text: '9'),
                CalcButton(callback: numClick, text: '*')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(callback: numClick, text: '4'),
                CalcButton(callback: numClick, text: '5'),
                CalcButton(callback: numClick, text: '6'),
                CalcButton(callback: numClick, text: '+')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(callback: numClick, text: '1'),
                CalcButton(callback: numClick, text: '2'),
                CalcButton(callback: numClick, text: '3'),
                CalcButton(callback: numClick, text: '-')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(callback: numClick, text: '.'),
                CalcButton(callback: numClick, text: '0'),
                CalcButton(
                  callback: numClick,
                  text: '00',
                  textSize: 24,
                ),
                CalcButton(callback: evaluate, text: '=')
              ],
            )
          ]),
        ),
      ),
    );
  }
}
