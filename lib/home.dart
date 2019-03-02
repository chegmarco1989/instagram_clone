import 'package:flutter/material.dart';
import './home_body.dart';

class Home extends StatelessWidget {
  final appBar = AppBar(
    leading: IconButton(
      icon: Icon(Icons.camera_alt),
      onPressed: () {},
    ),
    title: Text('Instagram'),
    backgroundColor: Colors.white,
    elevation: 1.0,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.live_tv),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.send),
        onPressed: () {},
      ),
    ],
  );

  final bottomNavigationBar = BottomAppBar(
    child: Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.add_box),
          Icon(Icons.favorite_border),
          Icon(Icons.person_outline),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: HomeBody(),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
