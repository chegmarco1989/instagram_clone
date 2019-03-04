import 'package:flutter/material.dart';
import '../random_image_url.dart';
import './post_detail.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(4, (int index) {
        return PostDetail(randomImageUrl());
      }),
    );
  }
}
