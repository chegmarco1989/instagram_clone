import 'package:flutter/material.dart';
import './stories.dart';
import './post_list.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Stories(),
        ),
        Expanded(
          flex: 5,
          child: PostList(),
        ),
      ],
    );
  }
}
