import 'package:flutter/material.dart';
import './feed/feed.dart';
import './explore/explore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum _Page { feed, explore, camera, favorite, profile }

class _HomeState extends State<Home> {
  _Page _currentPage = _Page.feed;
  Map<_Page, Widget> _pageToBody = {
    _Page.feed: Feed(),
    _Page.explore: Explore(),
  };

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

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _currentPage = _Page.feed;
                });
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _currentPage = _Page.explore;
                });
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add_box),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _pageToBody[_currentPage],
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}
