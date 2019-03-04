import 'dart:math';
import 'package:flutter/material.dart';
import './post_detail.dart';

final _postIconRadius = 16.0;

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(4, (int index) {
        final rnd = Random();
        final width = rnd.nextInt(1000);
        final height = rnd.nextInt(1000);

        return PostDetail(
            'https://via.placeholder.com/${width < 150 ? width + 150 : width}x${height < 150 ? width + 150 : height}');
      }),
    );
  }
}
