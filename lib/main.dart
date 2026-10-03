

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Calculator.dart';

import './router.dart';
import './NameChanger.dart';
import './currencyConvertor.dart';
import './todolist.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => NameChanger(),
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         routerConfig: router,
//       ),
//     ),
//   );
// }
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//   home:CurrencyConvertor()));
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//   home:TodoList()));
// }


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  home:Calculator()));
}