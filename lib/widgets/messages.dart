import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/modules/messages.dart';
import 'package:message_app/screens/chat_screen.dart';

class MessagesScroll extends StatefulWidget {
  @override
  _MessagesScrollState createState() => _MessagesScrollState();
}

class _MessagesScrollState extends State<MessagesScroll> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
            ),
            child: ListView.builder(
                itemCount: recentchat.length,
                itemBuilder: (context, index) {
                  final Messages chats = recentchat[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => (ChatScreen(user: chats.sender,)) )),
                    child: Container(
                      decoration: BoxDecoration(
                        color: chats.isRead == true ? Colors.white : Color(0XFFFFEFEE),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        )

                      ),
                      margin: EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        right: 20,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                            horizontal: 20.0
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(chats.sender.imageURL),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(chats.sender.name,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.45,
                                        child: Text(chats.text,
                                          overflow: TextOverflow.ellipsis
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(chats.time,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0
                              ),),
                              SizedBox(height: 6,),
                              chats.isRead == false? Container(
                                  height: 20,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Text('New',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  ),
                                  )
                              ): Text('')
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
    );
  }
}
