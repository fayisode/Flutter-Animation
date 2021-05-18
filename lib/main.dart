import 'package:animations/animation1.dart';
import 'package:animations/animation2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        ///This is a project that covers full flutter animation with  the following guidlines
        //TODO Setting animation with Single TickerProviderStateMixins
        //TODO Setting animation with TickerProviderStateMixin
        //TODO Setting animation with Transformation
        //TODO Setting animation with Fadeintransition
        //TODO Setting animation with Opacity
        //TODO Using the default widget animations

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        Animation1.routeName: (ctx) => Animation1(),
        Animation2.routeName: (ctx) => Animation2()
      },
    );
  }
}
