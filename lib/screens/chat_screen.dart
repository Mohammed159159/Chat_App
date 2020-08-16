import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/modules/messages.dart';
import 'package:message_app/modules/users.dart';

import 'home_screen.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Messages message, bool isMe) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          margin: isMe
              ? EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: MediaQuery.of(context).size.width * 0.25)
              : EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.time,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  message.text,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          decoration: BoxDecoration(
              color: isMe ? Theme.of(context).accentColor : Color(0XFFFFEFEE),
              borderRadius: BorderRadius.only(
                  topLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                  bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                  topRight:
                      isMe == false ? Radius.circular(15) : Radius.circular(0),
                  bottomRight: isMe == false
                      ? Radius.circular(15)
                      : Radius.circular(0))),
        ),
        !isMe
            ? IconButton(
                icon: !message.isLiked
                    ? Icon(Icons.favorite_border, color: Colors.blueGrey)
                    : Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
                onPressed: () {},
              )
            : SizedBox.shrink()
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).accentColor),
      height: 70.0,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.insert_emoticon,
              size: 35,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          Expanded(child: TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: 'Type your message...'),
            onChanged: (value) {},
          )),
          RotationTransition(
              turns: AlwaysStoppedAnimation(135 / 360),
              child: IconButton(
                icon: Icon(Icons.attachment),
                iconSize: 35,
                color: Colors.grey,
                onPressed: () {},
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            widget.user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen())),
            color: Colors.white,
            iconSize: 30,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
              iconSize: 30,
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.only(top: 15),
                          itemCount: chat.length,
                          itemBuilder: (context, index) {
                            final message = chat[index];
                            bool isMe = message.sender.id == me.id;
                            return _buildMessage(message, isMe);
                          }),
                    ),
                  ),
                ),
                _buildMessageComposer()
              ],
            ),
          ),
        ));
  }
}
