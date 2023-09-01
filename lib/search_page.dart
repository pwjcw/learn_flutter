import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';

class search_page extends StatefulWidget{
  @override
  State<search_page> createState() {
    // TODO: implement createState
   return search();
  }
}
class search extends State<search_page>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("搜索"),),
      body: Container(color: Colors.cyan,child: Text("搜索"),),
    );
  }
}