import 'package:flutter/material.dart';

class EmptyRatingText extends StatelessWidget {
  const EmptyRatingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('0.0',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}
