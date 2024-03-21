import 'package:flutter/material.dart';

class LineInCommentCard extends StatelessWidget {
  const LineInCommentCard(
      {super.key, required this.color, required this.width});
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      color: color,
    );
  }
}
