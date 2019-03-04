import 'package:flutter/material.dart';
import './topic_bar.dart';
import './photo_grid.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TopicBar(),
          ),
          Expanded(
            flex: 5,
            child: PhotoGrid(),
          ),
        ],
      ),
    );
  }
}
