import 'package:flutter/material.dart';

class InstaCaption extends StatefulWidget {
  final String username;
  final String content;
  final String wordSeparator;

  InstaCaption(this.username, this.content, {this.wordSeparator = ' '});

  @override
  _InstaCaptionState createState() => _InstaCaptionState();
}

class _InstaCaptionState extends State<InstaCaption> {
  bool showAll = false;

  buildWrapped() {
    final firstLineCharLimit = 35;
    final secondLineCharLimit = 30;

    if (widget.content.length > firstLineCharLimit) {
      final List<String> firstLine = [];
      final List<String> secondLine = [];

      for (var word in widget.content.split(widget.wordSeparator)) {
        if (firstLine.join(widget.wordSeparator).length < firstLineCharLimit) {
          firstLine.add(word);
        } else if (secondLine.join(widget.wordSeparator).length <
            secondLineCharLimit) {
          secondLine.add(word);
        }
      }

      final wrap = Wrap(
        children: <Widget>[
          Text(
            widget.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(' '),
          Text(firstLine.join(widget.wordSeparator)),
          Text(secondLine.join(widget.wordSeparator)),
          GestureDetector(
            child: Text('... more', style: TextStyle(color: Colors.grey[400])),
            onTap: () {
              setState(() {
                showAll = !showAll;
              });
            },
          ),
        ],
      );

      return SizedBox(
        width: double.infinity,
        child: wrap,
      );
    }

    return Text(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    if (showAll) {
      return Text(widget.content);
    }

    return buildWrapped();
  }
}
