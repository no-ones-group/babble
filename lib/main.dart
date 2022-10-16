import 'package:babble/Onboarding/log_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Babble',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const LogIn(),
    );
  }
}
