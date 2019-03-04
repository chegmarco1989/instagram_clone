import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final _children = List<Widget>.generate(10, (int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 25.0,
            child: Icon(Icons.person),
          ),
          Text(
            'Alice or Bob',
            style: TextStyle(
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _children,
      ),
    );
  }
}
