import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget{
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "",)));});

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(child: Container(
         height: 200,
         width: 200,
         child: Image.asset("assets/img.png", height: 200,width: 200,))),
   );
  }
}