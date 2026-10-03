import 'package:flutter/material.dart';

import './home.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './NameChanger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = '';

  void loginFunction() {
    final name = context.read<NameChanger>().name;
    print('Username: $name');
    print('Password: $password');
    if (name.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password'),
        ),
      );
      return;
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const Home()),
    // );
    context.push('/home', extra: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              // setState(() {
              //   username = value;
              // });
              context.read<NameChanger>().setName(value);
            },
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () {
              loginFunction();
            },
            child: const Text('Login'),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Age')),
              DataColumn(label: Text('Location')),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text('Gayathri')),
                  DataCell(Text('21')),
                  DataCell(Text('India')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('John')),
                  DataCell(Text('30')),
                  DataCell(Text('USA')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
