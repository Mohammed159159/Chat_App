import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/modules/messages.dart';
import 'package:message_app/screens/chat_screen.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourite contacts',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
                ),
                IconButton(icon: Icon(Icons.more_horiz,
                color: Colors.blueGrey,
                  size: 30,
                ), onPressed: null)
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
                itemCount: favouriteUsers.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(user: favouriteUsers[index]))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(favouriteUsers[index].imageURL),
                          ),
                          SizedBox(height: 6,),
                          Text(favouriteUsers[index].name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600

                          )
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
