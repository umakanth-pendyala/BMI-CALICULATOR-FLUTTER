import 'package:flutter/material.dart';


class IconColumnWidget extends StatelessWidget {
//  const IconColumnWidget({
//    Key key,
//  }) : super(key: key);
  final fontAwsomeIcon;
  final title;

  IconColumnWidget({this.title, this.fontAwsomeIcon});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontAwsomeIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ],
    );
  }
}
