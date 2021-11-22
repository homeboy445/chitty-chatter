import 'package:flutter/material.dart';

class TextSeperator extends StatelessWidget {
  const TextSeperator({Key key, @required this.size, @required this.child})
      : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(left: 10.0, right: 5.0),
              width: size.width * 0.38,
              height: 3.0,
              color: Colors.grey),
          child,
          Container(
              margin: EdgeInsets.only(left: 5.0, right: 10.0),
              width: size.width * 0.4,
              height: 3.0,
              color: Colors.grey)
        ]));
  }
}
