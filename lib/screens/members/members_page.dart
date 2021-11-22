import 'package:chitty_chatter/constants.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: kBackgroundColorLight,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
              child: Text("Your Comrades",
                  style: TextStyle(fontSize: 40.0, color: Colors.white))),
          Expanded(
            child: Container(
                child: ListView.builder(
                    itemCount: kmembers.length,
                    itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 5.0),
                        height: size.height * 0.069,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 2, bottom: 2, left: 5.0, right: 10.0),
                              child: CircleAvatar(
                                  backgroundColor: Colors.blue, radius: 50),
                            ),
                            Text(kmembers[index],
                                style: TextStyle(
                                    fontSize: 30.0, color: Colors.white)),
                          ],
                        )))),
          ),
        ],
      ),
    ));
  }
}
