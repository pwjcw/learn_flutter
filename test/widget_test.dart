import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled2/main.dart';

void main() {
  runApp(test_app());
}

class test_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "flutter 布局器",
            textAlign: TextAlign.center,
          ),
        ),
        body: app_main(),
      ),
    );
  }
}
class app_main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
      ],
    );
  }

}