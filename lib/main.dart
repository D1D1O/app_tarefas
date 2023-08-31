import 'package:flutter/material.dart';
import 'package:projeto_001/data/task_inherited.dart';
import 'package:projeto_001/screens/form_screen.dart';
import 'package:projeto_001/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskInherited(child: const InitalScreen()));
  }
}
