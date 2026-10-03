import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import './NameChanger.dart';

class Home extends StatelessWidget {
  
  final String password;
  Home({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final String name=context.watch<NameChanger>().name;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('Home Page'),
      ),
      body: Center(child: Text('Hello $name, your password is $password!')),
    );
  }
}
