import 'package:flutter/material.dart';
class SecondPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  SecondPageState createState() => new SecondPageState();
} 

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('界面2'),
        ),
        body: new Center(
          child: new Text('第2个界面'),
        ),
      );
  }
}