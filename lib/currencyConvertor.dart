import 'package:flutter/material.dart';

class CurrencyConvertor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CurrencyConvertorState();
  }
}


class _CurrencyConvertorState extends State<CurrencyConvertor> {
  double result = 0;
  double number = 0;
  void calculate(){
    setState(() {
      result = number * 82.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Convertor')),
      body: SafeArea(
        child: Column(
          children: [
            Text("INR : ${result.toString()}"),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter amount in USD'),
              onChanged: (value) {
                setState(() {
                  number = double.parse(value);
                  
                });
              },
            ),
            ElevatedButton(
              onPressed: calculate,
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
