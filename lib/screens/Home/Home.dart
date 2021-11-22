import 'package:chitty_chatter/constants.dart';
import 'package:chitty_chatter/screens/chatscreen/chat_screen.dart';
import 'package:chitty_chatter/screens/roomscreen/room_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const tstyle = TextStyle(fontSize: 40.0, color: Colors.white);

class Home extends StatefulWidget {
  final Function function;
  Home(this.function);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  // }
  bool isCollapsed = true;
  double screenHeight, screenWidth;
  String curText;
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        lowerBound: 0.4,
        upperBound: 0.8,
        duration: Duration(seconds: 1),
        vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(_controller);
    animation.addListener(() {
      print(animation.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toggleCollapsible() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RoomScreen(screenWidth: screenWidth),
          ChatScreen(
              widthValue: 0.80,
              isCollapsed: isCollapsed,
              screenWidth: screenWidth,
              function: toggleCollapsible),
        ],
      ),
    );
  }
}
