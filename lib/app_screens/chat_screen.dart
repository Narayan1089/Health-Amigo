import 'package:amigoproject/app_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:amigoproject/models/chatMessageModel.dart';
import 'dart:async';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "So follow up to @RobinSinha answer, using the Tab widget looks weirds as the Tab widget has an external padding, so i'd suggest to avoid that",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chat_background.png'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
              ),
            ),
          ),
          ListView.builder(
            itemCount: messages.length + 1,
            controller: _scrollController,
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: 10, bottom: MediaQuery.of(context).size.height * 0.07),
            itemBuilder: (context, index) {
              if (index == messages.length + 1) {
                Timer(
                  Duration(milliseconds: 3),
                  () => _scrollController
                      .jumpTo(_scrollController.position.maxScrollExtent),
                );
              }
              if (index == 0) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "This is the beginning\nof your chat history\nwith the Amigo Bot.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff939494),
                            fontFamily: "Poppins-Extra",
                            fontWeight: FontWeight.w900),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 110,
                        ),
                        child: Divider(
                          color: Color(0xff939494),
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                if (messages[index - 1].messageType == "receiver") {
                  return Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage('assets/images/chatbot.png'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 229),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffD6D6D6),
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: (messages[index - 1].messageType ==
                                          "receiver"
                                      ? Color(0xff4B4C4D)
                                      : Color(0xffA7A9AB)),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  messages[index - 1].messageContent,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 229),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffD6D6D6),
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: (messages[index - 1].messageType ==
                                          "receiver"
                                      ? Color(0xff4B4C4D)
                                      : Color(0xffA7A9AB)),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  messages[index - 1].messageContent,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(1, 2),
                                  )
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 25,
                                child: CircleAvatar(
                                  radius: 23,

                                  backgroundColor: Colors.white,
                                  child: const Text(
                                    'A',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ), //Has to be replaced by the initial of the user
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }
            },
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 15,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 15,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 5.0),
                          hintText: 'Type a Message',
                          border: InputBorder.none,
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Container(
                              child: Image(
                                image: AssetImage('assets/images/smile.png'),
                                height: 30,
                                width: 30,
                              ),
                              height: 70,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.newline,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffFF834F),
                    radius: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
