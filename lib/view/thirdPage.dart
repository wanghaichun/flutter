import 'package:flutter/material.dart';
class ThirdPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  ThirdPageState createState() => new ThirdPageState();
} 

class ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('界面3'),
        ),
        body: new Center(
          child: new Text('第3个界面'),
        ),
      );
  }
}