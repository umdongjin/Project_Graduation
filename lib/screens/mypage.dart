import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<UserInfo> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          title: const Text("UserInfo"), // second third 다름
        ),
        body: const Center(
            child: Text('UserInfo',
                style: TextStyle(fontSize: 40))) //second third 다름
    );
  }
}