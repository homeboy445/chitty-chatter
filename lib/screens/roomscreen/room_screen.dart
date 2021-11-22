import 'package:chitty_chatter/screens/roomjoinpage/join_room.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  String desc = "Description";
  bool isDescriptionCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: double.infinity,
              color: Color(0xFF32353A),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      6,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 4.0),
                            child: index != 5
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 27.0,
                                  )
                                : FloatingActionButton(
                                    backgroundColor: Color(0xFF1C1F24),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JoinRoom()));
                                    },
                                    child: Icon(Icons.add,
                                        size: 40.0, color: Colors.grey)),
                          )),
                ),
              ),
            ),
            Container(
                color: Color(0xFF555a63),
                width: widget.screenWidth * 0.65,
                padding: EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text("Room Name",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white)),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Color(0xFF7289D9);
                                return Color(
                                    0xFF7289D9); // Use the component's default.
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Invite friends",
                              style: TextStyle(fontSize: 23.0))),
                      Container(
                          margin: EdgeInsets.only(top: 100),
                          color: Color(0xFF555a63),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isDescriptionCollapsed =
                                    !isDescriptionCollapsed;
                              });
                            },
                            child: isDescriptionCollapsed
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Description",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.0)),
                                      Icon(
                                          isDescriptionCollapsed
                                              ? Icons.arrow_drop_down
                                              : Icons.arrow_drop_up,
                                          size: 30.0)
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Description",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25.0)),
                                            Icon(
                                                isDescriptionCollapsed
                                                    ? Icons.arrow_drop_down
                                                    : Icons.arrow_drop_up,
                                                size: 30.0)
                                          ]),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                            "This is a place where awesome people roll together!",
                                            style: TextStyle(
                                                fontSize: 23.0,
                                                color: Colors.white)),
                                      )
                                    ],
                                  ),
                          )),
                    ]))
          ],
        ),
      ),
    );
  }
}
