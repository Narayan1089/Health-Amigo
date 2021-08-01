// import 'package:amigoproject/app_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:amigoproject/models/chatMessageModel.dart';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:emoji_picker/emoji_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController = ScrollController();
  bool keyboardfocus = false;
  bool visibilityEmoji = false;
  bool visibilityTextInput = true;
  double h = 0.0;
  FocusNode focus = FocusNode();
  bool t = true;

  bool isShowSticker = false;

  Widget buildSticker() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
//      buttonMode: ButtonMode.MATERIAL,
//      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        print(emoji);
      },
    );
  }

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "emoji") {
        visibilityEmoji = visibility;
      }
      if (field == "textinput") {
        visibilityTextInput = visibility;
      }
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          isShowSticker = false;
        });
      }
    });
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
    ChatMessage(
        messageContent: "How are you feeling - right now?",
        messageType: "receiver"),
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
                top: 10,
                bottom: visibilityTextInput && !isShowSticker
                    ? MediaQuery.of(context).size.height * 0.07
                    : h),
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
                  print(index);
                  if (index == (messages.length)) {
                    if (messages[index - 1].messageContent ==
                            "How are you feeling - right now?" &&
                        t) {
                      Timer(Duration(milliseconds: 500), () {
                        _changed(true, "emoji");
                        _changed(false, "textinput");
                        setState(() {
                          h = MediaQuery.of(context).size.height * 0.23;
                        });
                        print(h);
                        t = false;
                      });
                    }
                  }
                  return Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // CircleAvatar(
                            //   radius: 25,
                            //   backgroundColor: Colors.transparent,
                            //   backgroundImage:
                            //       AssetImage('assets/images/chatbot.png'),
                            // ),
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
                  print(index);

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
                            // SizedBox(
                            //   width: 5,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     shape: BoxShape.circle,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.black.withOpacity(0.3),
                            //         spreadRadius: 2,
                            //         blurRadius: 3,
                            //         offset: Offset(1, 2),
                            //       )
                            //     ],
                            //   ),
                            //   child: CircleAvatar(
                            //     backgroundColor: Colors.black,
                            //     radius: 25,
                            //     child: CircleAvatar(
                            //       radius: 23,

                            //       backgroundColor: Colors.white,
                            //       child: const Text(
                            //         'A',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.w900,
                            //           fontSize: 16,
                            //         ),
                            //       ), //Has to be replaced by the initial of the user
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }
            },
          ),
          visibilityTextInput
              ? WillPopScope(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
//                      height: MediaQuery.of(context).size.height,
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
                                    focusNode: focus,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      hintText: 'Type a Message',
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(
                                        onPressed: () {
                                          focus.unfocus();
                                          focus.canRequestFocus = false;
                                          if (isShowSticker) {
                                            focus.canRequestFocus = true;
                                            focus.requestFocus();
                                          }
                                          setState(() {
                                            isShowSticker = !isShowSticker;
                                            h = MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.40;
                                            debugPrint(
                                                isShowSticker.toString());
                                          });
                                        },
                                        icon: isShowSticker
                                            ? Icon(Icons.keyboard)
                                            : Container(
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/smile.png'),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          (isShowSticker ? buildSticker() : Container())
                        ],
                      ),
                    ],
                  ),
                  onWillPop: () {
                    if (isShowSticker) {
                      setState(() {
                        isShowSticker = false;
                      });
                    } else {
                      Navigator.pop(context);
                    }
                    return Future.value(false);
                  },
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 50, right: 50),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xffFE834F),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _changed(false, "emoji");
                                  _changed(true, "textinput");
                                },
                                icon: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/smile.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
