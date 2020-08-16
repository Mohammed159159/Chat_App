import 'package:flutter/material.dart';

class ScrollScreen1 extends StatefulWidget {
  @override
  _ScrollScreen1State createState() => _ScrollScreen1State();
}

class _ScrollScreen1State extends State<ScrollScreen1> {
  int selectedindex = 0;
  final List<String> categories = ['Messages', 'Groups', 'Online', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedindex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: index == selectedindex ? Colors.white : Colors.white60,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1
                  ),
                ),
              ),
            );
          }),
    );
  }
}
