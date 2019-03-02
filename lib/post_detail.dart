import 'package:flutter/material.dart';

final _postIconRadius = 16.0;

class PostDetail extends StatelessWidget {
  final headerBar = Container(
    padding: EdgeInsets.only(left: 10.0),
    child: Row(
      children: <Widget>[
        CircleAvatar(
          radius: _postIconRadius,
          child: Icon(Icons.person),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text('Alice or Bob'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    ),
  );

  final image = Image.network('https://via.placeholder.com/400x320');

  final actionsBar = Row(
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.favorite_border),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.message),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.send),
        onPressed: () {},
      ),
      Expanded(
        child: Text(''),
      ),
      IconButton(
        icon: Icon(Icons.bookmark_border),
        onPressed: () {},
      ),
    ],
  );

  final likesBar = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 30.0,
                child: CircleAvatar(
                  radius: 10.0,
                  child: Icon(Icons.person),
                ),
              ),
              Positioned(
                left: 15.0,
                child: CircleAvatar(
                  radius: 10.0,
                  child: Icon(Icons.person),
                ),
              ),
              CircleAvatar(
                radius: 10.0,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text.rich(
            TextSpan(children: [
              TextSpan(text: 'Liked by '),
              TextSpan(
                text: 'Alice',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' and '),
              TextSpan(
                text: '10,247 others',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ],
    ),
  );

  final captionBar = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: InstaCaption(username, lorem),
  );

  final commentInputBar = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: <Widget>[
        CircleAvatar(
          child: Icon(Icons.person),
          radius: _postIconRadius,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Add a comment...'),
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: <Widget>[
          headerBar,
          image,
          actionsBar,
          likesBar,
          captionBar,
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'View all comments',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          commentInputBar,
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2 minutes ago',
                style: TextStyle(color: Colors.grey[400], fontSize: 10.0),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

final username = 'alicebob123';
final lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam malesuada bibendum arcu vitae elementum. Dictum sit amet justo donec. Arcu non sodales neque sodales ut etiam sit amet nisl. Elit pellentesque habitant morbi tristique. Eu facilisis sed odio morbi.';

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
