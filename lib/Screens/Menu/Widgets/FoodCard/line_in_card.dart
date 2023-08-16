import 'package:flutter/material.dart';

class LineInCard extends StatelessWidget {
  const LineInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 20,
      endIndent: 20,
      thickness: 2,
      color: Colors.blue,
    );
  }
}