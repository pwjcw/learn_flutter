import 'package:flutter/material.dart';

class Image_widget extends StatelessWidget {
  final double widget;
  final double height;
  final String src;
  const Image_widget(
      {super.key,
      this.widget = double.infinity,
      this.height = 200,
      required this.src}); //指定传入的参数
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget,
      height: height,
      child: Image.network(src,fit: BoxFit.cover,),
    );
  }
}
