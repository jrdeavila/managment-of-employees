import 'package:flutter/material.dart';
import 'package:rna_learning/screens/home_screen.dart';
import 'package:rna_learning/screens/employees_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'RNA Machine Learning',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.dark,
      ),
      // home: const MyHomePage(title: 'Machine Learning RNA'),
      home: EmployeesPage(),
    );
  }
}
