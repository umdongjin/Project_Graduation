import 'package:flutter/material.dart';

class Writing extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Writing> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          title: const Text("Writing"), // second third 다름
        ),
        body: const Center(
            child: Text('Writing',
                style: TextStyle(fontSize: 40))) //second third 다름
    );
  }
}