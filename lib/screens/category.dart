import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Category> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          title: const Text("Category"), // second third 다름
        ),
        body: const Center(
            child: Text('Category',
                style: TextStyle(fontSize: 40))) //second third 다름
    );
  }
}