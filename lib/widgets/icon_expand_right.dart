import 'package:flutter/material.dart';

class IconExpandRight extends StatelessWidget {
  const IconExpandRight({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Icon(Icons.expand_more, color: color),
    );
  }
}
