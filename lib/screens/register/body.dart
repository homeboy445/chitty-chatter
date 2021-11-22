import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/signup_top.png",
                  height: size.height * 0.2)),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png",
                  height: size.height * 0.18)),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/login_bottom.png',
                  height: size.height * 0.15)),
          child
        ]));
  }
}
