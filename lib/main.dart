import 'package:cooler/views/HomeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoolApp());
}

class CoolApp extends StatelessWidget {
  const CoolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: ("final"), home: 
        HomeView());
  }
}
