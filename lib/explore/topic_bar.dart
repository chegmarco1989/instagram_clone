import 'package:flutter/material.dart';

class TopicBar extends StatelessWidget {
  List<Widget> _buildChildren() {
    final spacer = SizedBox(
      width: 8.0,
    );
    final List<Widget> children = [spacer];

    for (var i = 0; i < 5; i++) {
      children.add(ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Container(
          color: Colors.grey,
          width: 100.0,
        ),
      ));

      children.add(spacer);
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildChildren(),
        padding: EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }
}
