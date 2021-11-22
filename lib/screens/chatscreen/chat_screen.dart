import 'package:chitty_chatter/screens/members/members_page.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key key,
      @required this.isCollapsed,
      @required this.screenWidth,
      @required this.function,
      @required this.widthValue})
      : super(key: key);

  final bool isCollapsed;
  final double screenWidth;
  final Function function;
  final double widthValue;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();

  String capitalize(String str) {
    String s = str[0].toUpperCase();
    return s +
        str.substring(
          1,
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
    if (widget.isCollapsed) {}
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.8 * widget.screenWidth,
      right: widget.isCollapsed ? 0 : -0.2 * widget.screenWidth,
      child: Material(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF373A41),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF2C2F34),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black,
                        //     offset: Offset(0.0, 1.0), //(x,y)
                        //     blurRadius: 6.0,
                        //   ),
                        // ]
                      ),
                      height: 60.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                                widget.isCollapsed
                                    ? Icons.menu
                                    : Icons.arrow_back,
                                size: 35.0,
                                color: Colors.white),
                            onPressed: () {
                              widget.function();
                            },
                          ),
                          Row(
                            children: [
                              Icon(Icons.search,
                                  size: 35.0, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MembersPage()));
                                  },
                                  icon: Icon(Icons.people,
                                      size: 35.0, color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: ListView.builder(
                              itemCount: kchatData.length,
                              itemBuilder: (context, index) => Container(
                                  padding: EdgeInsets.all(5.0),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.centerLeft,
                                  child: !(kchatData[index > 0
                                                  ? index - 1
                                                  : index]['sender'] ==
                                              kchatData[index]['sender'] &&
                                          index > 0)
                                      ? Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 16.0),
                                              padding: EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/user.png")),
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          capitalize(
                                                              kchatData[index]
                                                                  ['sender']),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 28.0)),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Text(
                                                            kchatData[index]
                                                                ['sent-on'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey)),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: size.width *
                                                        widget.widthValue,
                                                    child: Text(
                                                        kchatData[index]
                                                            ['message'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19.0)),
                                                  )
                                                ]),
                                          ],
                                        )
                                      : Container(
                                          color: Colors.grey,
                                          width: widget.screenWidth * 0.80,
                                          child: Text(
                                              kchatData[index]['message'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19.0)),
                                        )))
                          /* /**Use-Case 1 */ ListView.builder(
                              controller: _scrollController,
                              itemCount: kchatData.length,
                              itemBuilder: (context, index) => Align(
                                  alignment:
                                      kchatData[index]['sender'] == 'will'
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: kchatData[index]['sender'] == 'will'
                                                    ? Radius.circular(10)
                                                    : Radius.zero,
                                                bottomLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomRight: kchatData[index]
                                                            ['sender'] ==
                                                        'will'
                                                    ? Radius.zero
                                                    : Radius.circular(10)),
                                            color: kchatData[index]['sender'] == 'will'
                                                ? Color(0xFF7289D9)
                                                : Color(0xFF32353A)),
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: kchatData[index]['sender'] ==
                                                'will'
                                            ? Text(kchatData[index]['message'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0))
                                            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                Container(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: Text('hugh',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.orange)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 4.0),
                                                  child: Text(
                                                      kchatData[index]
                                                          ['message'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16)),
                                                )
                                              ])),
                                  ))) */
                          )),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: widget.screenWidth * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                        controller: _textController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type your message",
                            prefixIcon: Icon(Icons.emoji_emotions),
                            filled: false,
                            suffixIcon: IconButton(
                                icon: Icon(Icons.send, color: kPrimaryColor),
                                onPressed: () {
                                  kchatData.add({
                                    'sender': 'will',
                                    'message': _textController.text,
                                    'sent-on': '12 Jan 2021, 19:05'
                                  });
                                  _textController.clear();
                                }))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
