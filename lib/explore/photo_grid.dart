import 'dart:math';
import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  Widget _buildBox(double unit) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      height: unit,
      width: unit,
    );
  }

  Widget _build3Small(double unit) {
    return Row(
      children: List.generate(3, (int index) {
        return _buildBox(unit);
      }),
    );
  }

  Widget _build2Small1Large(double unit) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildBox(unit),
            _buildBox(unit),
          ],
        ),
        _buildBox(unit * 2),
      ],
    );
  }

  Widget _build1Large2Small(double unit) {
    return Row(
      children: <Widget>[
        _buildBox(unit * 2),
        Column(
          children: <Widget>[
            _buildBox(unit),
            _buildBox(unit),
          ],
        ),
      ],
    );
  }

  _buildChildren(double unit) {
    return <Widget>[
      _build3Small(unit),
      _build1Large2Small(unit),
      _build2Small1Large(unit),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    final unit = windowWidth / 3;

    return ListView(
      children: _buildChildren(unit),
    );
  }
}
