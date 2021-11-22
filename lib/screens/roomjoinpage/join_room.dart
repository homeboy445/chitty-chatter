import 'package:chitty_chatter/constants.dart';
import 'package:chitty_chatter/screens/components/text_seperator.dart';
import 'package:chitty_chatter/screens/roomjoinpage/create_room.dart';
import 'package:chitty_chatter/screens/roomjoinpage/join_friend.dart';
import 'package:flutter/material.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: kBackgroundColorLight,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close,
                              color: Colors.white, size: 30.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Create Your Room",
                          style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      width: size.width * 0.97,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: Center(
                        child: Text(
                            "Your room is just like your second home where you and your homies chill the hell out!",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: size.height * 0.112,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF2A2B2F)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateRoom()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Icon(Icons.room),
                                    ),
                                    Text("Create Your Own",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white))
                                  ]),
                              Icon(Icons.arrow_forward_ios_outlined, size: 25.0)
                            ],
                          )),
                    ),
                    TextSeperator(
                        size: size,
                        child: Text("Or",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                color: Colors.grey,
                                letterSpacing: 1.0))),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: size.height * 0.112,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF2A2B2F)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinExternalRoom()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Icon(Icons.people_alt_outlined),
                                    ),
                                    Text("Join Friend's",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white))
                                  ]),
                              Icon(Icons.arrow_forward_ios_outlined, size: 25.0)
                            ],
                          )),
                    )
                  ],
                ))));
  }
}
