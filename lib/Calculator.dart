import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Calculator();
  }
}

Widget NumberBtn(
  String number,
  Color bgColor,
  BuildContext context,
  VoidCallback onPressed,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: const CircleBorder(),
        minimumSize: Size(
          MediaQuery.of(context).size.width / 5,
          MediaQuery.of(context).size.width / 5,
        ),
      ),
      child: Text(
        number,
        style: const TextStyle(fontSize: 28, color: Colors.black),
      ),
    ),
  );
}

class _Calculator extends State<Calculator> {
  bool isEqualPressed = false;
  int decimalCount = 0;
  double answer = 0;
  String input = '';
  String op = '';
  List<String> operands = [];
  List<String> operators = [];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculator', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Text(
                  input,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),

            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 20),
            //     child: Text(
            //       answer.toString(),
            //       style: const TextStyle(fontSize: 28, color: Colors.white),
            //     ),
            //   ),
            // ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEqualPressed = false;
                          decimalCount = 0;
                          input = '';
                          answer = 0;
                          operands.clear();
                          operators.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Clear',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEqualPressed = false;
                          if (input.isEmpty) {
                            return;
                          }

                          input = input.trimRight().substring(
                            0,
                            input.trimRight().length - 1,
                          );
                          List<String> parts = input.split(RegExp(r'[+\-x/]'));

                          String currentNumber = parts.last;

                          if (currentNumber.contains('.')) {
                            decimalCount = 1;
                          } else {
                            decimalCount = 0;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(80, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Icon(Icons.backspace, color: Colors.black),
                      //  const Text(
                      //   'x',
                      //   style: TextStyle(color: Colors.black),
                      // ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberBtn('7', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '7';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '7';
                  });
                }),
                NumberBtn('8', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '8';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '8';
                  });
                }),
                NumberBtn('9', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '9';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '9';
                  });
                }),
                NumberBtn('/', Colors.orange, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      isEqualPressed = false;
                    }
                    decimalCount = 0;
                    if (input.isEmpty) {
                      return;
                    }
                    if (input.trim().endsWith('+') ||
                        input.trim().endsWith('-') ||
                        input.trim().endsWith('x') ||
                        input.trim().endsWith('/')) {
                      input = input.substring(0, input.length - 1);
                    }
                    input = input + '/';
                  });
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberBtn('4', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '4';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '4';
                  });
                }),
                NumberBtn('5', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '5';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '5';
                  });
                }),
                NumberBtn('6', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '6';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '6';
                  });
                }),
                NumberBtn('x', Colors.orange, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      isEqualPressed = false;
                    }
                    decimalCount = 0;
                    if (input.isEmpty) {
                      return;
                    }
                    if (input.trim().endsWith('+') ||
                        input.trim().endsWith('-') ||
                        input.trim().endsWith('x') ||
                        input.trim().endsWith('/')) {
                      input = input.substring(0, input.length - 1);
                    }
                    input = input + 'x';
                  });
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberBtn('1', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '1';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '1';
                  });
                }),
                NumberBtn('2', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '2';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '2';
                  });
                }),
                NumberBtn('3', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '3';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '3';
                  });
                }),
                NumberBtn('-', Colors.orange, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      isEqualPressed = false;
                    }
                    decimalCount = 0;
                    if (input.trim().endsWith('-')) {
                      return;
                    }

                    if (input.trim().endsWith('+') ||
                        input.trim().endsWith('-') ||
                        input.trim().endsWith('x') ||
                        input.trim().endsWith('/')) {
                      input = input.substring(0, input.length - 1);
                    }
                    input = input + '-';
                  });
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberBtn('0', Colors.white, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      input = '';
                      input = input + '0';
                      isEqualPressed = false;
                      return;
                    }
                    input = input + '0';
                  });
                }),
                NumberBtn('.', Colors.white, context, () {
                  setState(() {
                    if (decimalCount > 0) {
                      return;
                    }
                    decimalCount = 1;
                    if(isEqualPressed) {
                      input = '';
                      input = input + '0.';
                      isEqualPressed = false;
                      return;
                    }
                    if (input.isEmpty ||
                        input.trim().endsWith('+') ||
                        input.trim().endsWith('-') ||
                        input.trim().endsWith('x') ||
                        input.trim().endsWith('/')) {
                      input = input + '0.';
                    } else {
                      input = input + '.';
                    }
                  });
                }),
                NumberBtn('=', Colors.orange, context, () {
                  setState(() {
                    isEqualPressed = true;
                    decimalCount = 0;
                    operands.clear();
                    operators.clear();
                    if (input.isEmpty) {
                      return;
                    }
                    if (input.trim().endsWith('+') ||
                        input.trim().endsWith('-') ||
                        input.trim().endsWith('x') ||
                        input.trim().endsWith('/')) {
                      input = input.substring(0, input.length - 1);
                    }
                    String a = '';
                    for (int i = 0; i < input.length; i++) {
                      if (input[i] == '+' ||
                          input[i] == '-' ||
                          input[i] == 'x' ||
                          input[i] == '/') {
                        if (i == 0 && input[i] == '-') {
                          a = a + input[i];
                          continue;
                        } else if (input[i] == '-' &&
                            (input[i - 1] == '+' ||
                                input[i - 1] == '-' ||
                                input[i - 1] == 'x' ||
                                input[i - 1] == '/')) {
                          a = a + input[i];
                          continue;
                        }
                        operands.add(a);
                        operators.add(input[i]);
                        a = '';
                      } else {
                        a = a + input[i];
                      }
                    }
                    operands.add(a);
                    int j = 0;
                    double res = 0;
                    for (int i = 0; i < operands.length; i++) {
                      if (i == 0) {
                        res = double.parse(operands[i]);
                      } else {
                        if (operators[j] == '+') {
                          res = res + double.parse(operands[i]);
                        } else if (operators[j] == '-') {
                          res = res - double.parse(operands[i]);
                        } else if (operators[j] == 'x') {
                          res = res * double.parse(operands[i]);
                        } else if (operators[j] == '/') {
                          if (double.parse(operands[i]) == 0) {
                            input = '';
                            operands.clear();
                            operators.clear();
                            answer = 0;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cannot divide by zero'),
                              ),
                            );
                            return;
                          }
                          res = res / double.parse(operands[i]);
                        }
                        j++;
                      }
                    }
                    answer = res;
                    input = res.toStringAsFixed(2);
                  });
                }),
                NumberBtn('+', Colors.orange, context, () {
                  setState(() {
                    if (isEqualPressed) {
                      isEqualPressed = false;
                    }
                    decimalCount = 0;
                    if (input.isEmpty) {
                      return;
                    }
                    if (input.trim().endsWith('+') ||
                        input.trim().endsWith('-') ||
                        input.trim().endsWith('x') ||
                        input.trim().endsWith('/')) {
                      input = input.substring(0, input.length - 1);
                    }
                    input = input + '+';
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
