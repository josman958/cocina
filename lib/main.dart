import 'package:flutter/material.dart';
import 'package:cocina/pages/example1.dart';
import 'package:cocina/pages/example2.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Primer ejemplo'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example2()),
            );
          },
        ),
      ),
    );
  }
}
