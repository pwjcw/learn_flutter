import 'package:flutter/material.dart';
//自定义dialog
class Mydialog extends Dialog{
  const Mydialog({super.key});
  @override
  Widget build(BuildContext context){
    return Material(
      type: MaterialType.transparency,    //设置透明效果，此方法可以看到之前的页面
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Text("5111"),
        ),
      )
    );
  }
}