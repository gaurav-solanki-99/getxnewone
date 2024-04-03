import 'package:flutter/material.dart';
class Mywidget{


  static mybutton(String text)
  {
   return  Container(
        width: 200,
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Center(child: Text("$text")));

  }
}