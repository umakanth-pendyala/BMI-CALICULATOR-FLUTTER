import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {

  final Color backgroundCol;
  final childWidget;

  MyCard({this.backgroundCol, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: backgroundCol,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}