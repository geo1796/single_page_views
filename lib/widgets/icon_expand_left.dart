import 'package:flutter/material.dart';

class IconExpandLeft extends StatelessWidget {
  const IconExpandLeft({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Icon(Icons.expand_more, color: color),
    );
  }
}
