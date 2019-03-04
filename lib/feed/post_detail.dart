import 'package:flutter/material.dart';
import '../UI/instagram_caption.dart';

final _postIconRadius = 16.0;

class PostDetail extends StatelessWidget {
  final String imageUrl;

  PostDetail(this.imageUrl);

  final _headerBar = Container(
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

  Widget _buildImage() => Center(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 150.0,
            maxHeight: 350.0,
          ),
          child: Image.network(imageUrl),
        ),
      );

  final _actionsBar = Row(
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

  final _likesBar = Container(
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

  final _captionBar = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: InstaCaption(username, lorem),
  );

  final _commentInputBar = Container(
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

  final _viewAllComments = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'View all comments',
        style: TextStyle(color: Colors.grey[400]),
      ),
    ),
  );

  final _minutesAgo = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '2 minutes ago',
        style: TextStyle(color: Colors.grey[400], fontSize: 10.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: <Widget>[
          _headerBar,
          _buildImage(),
          _actionsBar,
          _likesBar,
          _captionBar,
          SizedBox(
            height: 5.0,
          ),
          _viewAllComments,
          SizedBox(
            height: 5.0,
          ),
          _commentInputBar,
          SizedBox(
            height: 5.0,
          ),
          _minutesAgo,
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
