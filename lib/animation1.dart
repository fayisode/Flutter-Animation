import 'package:animations/animation2.dart';
import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  @override
  static const routeName = "/";
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Animation<Offset> offset;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    offset = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Flutter Animation with SingleTickerProviderStateMixin"),
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.brown),
                        child: Center(
                          child: Text(
                            "Scale Transition",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: SizeTransition(
                        sizeFactor: _animation,
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: Text(
                              "Size Transition",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _animation,
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.red),
                        child: Center(
                          child: Text(
                            "Fade Transition",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _animation,
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.pink),
                        child: Center(
                          child: Text(
                            "Rotation Transition",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: offset,
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.yellow),
                        child: Center(
                          child: Text(
                            "Slide Transition",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Animation2.routeName),
                        child: Text("Next Animation Page"))
                  ],
                );
              }),
        ),
      ),
    ));
  }
}
