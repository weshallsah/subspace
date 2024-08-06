import 'package:flutter/material.dart';

class HomeError extends StatefulWidget {
  const HomeError({super.key});

  @override
  State<HomeError> createState() => _HomeErrorState();
}

class _HomeErrorState extends State<HomeError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Something went wrong",
        ),
      ),
    );
  }
}
