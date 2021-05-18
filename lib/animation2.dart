import 'package:animations/animation1.dart';
import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  @override
  static const routeName = "/animation2-screen";

  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with TickerProviderStateMixin {
  /// this allow multiple controller configuration
  /// will be implementing another configuration for transformation
  Animation<double> _animation;
  Animation<double> _animation2;
  AnimationController _controller;
  AnimationController _controller2;
  Animation<Offset> offset;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    offset = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
    _controller2.forward();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Flutter Animation with TickerProviderStateMixin"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Transform.scale(
                          scale: _animation2.value,
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(color: Colors.indigo),
                            child: Center(
                              child: Text(
                                "Scale Transition with transformation",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Transform.rotate(
                          angle: 1 * (1 - _animation2.value),
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(color: Colors.purple),
                            child: Center(
                              child: Text(
                                "Rotation Transition with transformation",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Transform(
                          transform: Matrix4.translationValues(
                              100 * (1 - _animation2.value), 0.0, 0.0),
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(color: Colors.brown),
                            child: Center(
                              child: Text(
                                "Slide Transition with transformation",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, Animation1.routeName),
                            child: Text("Back")),
                        TextButton(
                            onPressed: () {},
                            child: Text("Next Animation Page")),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    ));
  }
}
