import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subspace/Home/UI/Homepage.dart';
import 'package:subspace/Detail/UI/detailpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}
