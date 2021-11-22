import 'package:flutter/material.dart';
import '../../constants.dart';

class CreateRoom extends StatefulWidget {
  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            height: size.height,
            color: kBackgroundColorLight,
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(3.0),
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_outlined,
                      size: 30.0, color: Colors.white),
                ),
              ),
              Container(
                child: Text("Create Your Room",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                child: Text(
                    "Creating room is a fun thing. Just name it, invite your friends and chill!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
              Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: CircleAvatar(
                      backgroundColor: Colors.cyanAccent, radius: 50.0)),
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(5.0),
                        child: Text("Give it a cool name!",
                            style: TextStyle(
                                fontSize: 23.0, color: Colors.white))),
                    TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: kInputColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kMainColor),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Enter room name',
                            prefixIcon:
                                Icon(Icons.room_service, color: Colors.white))),
                    Container(
                      width: size.width * 0.9,
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: TextButton(
                          style:
                              TextButton.styleFrom(backgroundColor: kMainColor),
                          onPressed: () {},
                          child: Text("Create Room",
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white))),
                    )
                  ],
                ),
              )
            ])),
      ),
    ));
  }
}
