import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:message_app/widgets/categories.dart';
import 'package:message_app/widgets/favourites.dart';
import 'package:message_app/widgets/messages.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 28.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Chat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon((Icons.search)),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          ScrollScreen1(),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              children: [Favourites(), MessagesScroll()],
            ),
          ))
        ],
      ),
    );
  }
}
