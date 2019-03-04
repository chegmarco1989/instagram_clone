import 'package:flutter/material.dart';
import '../random_image_url.dart';

class PhotoGrid extends StatelessWidget {
  final spacing = 20.0;

  Widget _buildBox(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: Image.network(
        randomImageUrl(),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _build3Small(double windowWidth) {
    final width = windowWidth / 3 - spacing * 2 / 3;
    final height = width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildBox(height, width),
        _buildBox(height, width),
        _buildBox(height, width),
      ],
    );
  }

  Widget _build1Large2Small(double windowWidth, {largeFirst = true}) {
    final unit = windowWidth / 3 - spacing * 2 / 3;
    final rowChildren = <Widget>[
      _buildBox(unit * 2 + spacing, unit * 2 + spacing),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBox(unit, unit),
          _buildBox(unit, unit),
        ],
      ),
    ];

    return Container(
      height: unit * 2 + spacing,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: largeFirst ? rowChildren : rowChildren.reversed.toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: <Widget>[
        _build3Small(windowWidth),
        SizedBox(
          height: spacing,
        ),
        _build1Large2Small(windowWidth),
        SizedBox(
          height: spacing,
        ),
        _build1Large2Small(windowWidth, largeFirst: false),
      ],
    );
  }
}
