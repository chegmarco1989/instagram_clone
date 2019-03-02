import 'package:flutter/material.dart';
import './post_detail.dart';

final _postIconRadius = 16.0;

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(4, (int index) {
        return PostDetail();
      }),
    );
  }
}
