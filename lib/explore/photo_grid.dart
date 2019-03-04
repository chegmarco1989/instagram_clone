import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  List<Widget> _buildGridTiles() {
    final List<Widget> tiles = [];

    for (var i = 0; i < 10; i++) {
      tiles.add(Image.network('https://via.placeholder.com/150'));
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: _buildGridTiles(),
      mainAxisSpacing: 2.5,
      crossAxisSpacing: 2.5,
    );
  }
}
