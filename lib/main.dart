import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Database',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
