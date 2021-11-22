import 'package:chitty_chatter/constants.dart';
import 'package:flutter/material.dart';

class JoinExternalRoom extends StatefulWidget {
  @override
  _JoinExternalRoomState createState() => _JoinExternalRoomState();
}

class _JoinExternalRoomState extends State<JoinExternalRoom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            color: Color(0xFF555a63),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                      child: Text("Got an Invitation?",
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Enter the code you got below.",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.grey[350]))),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: kInputColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kMainColor),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Enter code',
                            prefixIcon: Icon(Icons.insert_invitation,
                                color: Colors.white))),
                  ),
                  Container(
                    width: size.width * 0.9,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF596BF3)),
                        onPressed: () {},
                        child: Text("Let's go",
                            style: TextStyle(
                                fontSize: 25.0, color: Colors.white))),
                  )
                ],
              ),
            )));
  }
}
