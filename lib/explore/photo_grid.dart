import 'dart:math';
import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  final double spacing;
  final List<String> imageUrls;
  BuildContext _context;

  PhotoGrid(this.imageUrls, this.spacing);

  _onImageLongPress(Widget image) {
    return showDialog(
        context: _context,
        builder: (context) {
          return Dialog(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(_context).size.height,
              ),
              child: image,
            ),
          );
        });
  }

  Widget _buildBox(double height, double width, String url) {
    final image = Image.network(
      url,
      fit: BoxFit.cover,
    );

    return Container(
      height: height,
      width: width,
      child: url.isEmpty
          ? Text('')
          : GestureDetector(
              onLongPress: () => _onImageLongPress(image),
              child: image,
            ),
    );
  }

  Widget _build3Small(double windowWidth, List<String> urls) {
    final width = windowWidth / 3 - spacing * 2 / 3;
    final height = width;

    return Container(
      margin: EdgeInsets.only(bottom: spacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBox(height, width, urls[0]),
          _buildBox(height, width, urls[1]),
          _buildBox(height, width, urls[2]),
        ],
      ),
    );
  }

  Widget _build1Large2Small(double windowWidth, List<String> urls,
      {bool largeFirst = true}) {
    final unit = windowWidth / 3 - spacing * 2 / 3;
    final rowChildren = <Widget>[
      _buildBox(unit * 2 + spacing, unit * 2 + spacing, urls[0]),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBox(unit, unit, urls[1]),
          _buildBox(unit, unit, urls[2]),
        ],
      ),
    ];

    return Container(
      margin: EdgeInsets.only(bottom: spacing),
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
    final urlCount = imageUrls.length;

    return ListView.builder(
      itemCount: (urlCount / 3).ceil(),
      itemBuilder: (BuildContext context, int index) {
        _context = context;

        final List<String> urls = [];
        for (var i = 0; i < 3; i++) {
          final url = index * 3 + i < urlCount ? imageUrls[index * 3 + i] : '';
          urls.add(url);
        }

        Widget row;
        final rnd = Random();
        final prob = rnd.nextDouble();

        if (prob <= 0.3) {
          row = _build3Small(windowWidth, urls);
        } else if (prob <= 0.6) {
          row = _build1Large2Small(windowWidth, urls);
        } else {
          row = _build1Large2Small(windowWidth, urls, largeFirst: false);
        }

        return row;
      },
    );
  }
}
