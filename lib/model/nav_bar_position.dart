import 'package:flutter/rendering.dart';

enum NavBarPosition {
  left,
  top,
  right,
  bottom;

  bool get isLeft => this == NavBarPosition.left;
  bool get isTop => this == NavBarPosition.top;
  bool get isRight => this == NavBarPosition.right;
  bool get isBottom => this == NavBarPosition.bottom;

  bool get isVertical => isLeft || isRight;
  bool get isHorizontal => isTop || isBottom;

  Axis get axis => isVertical ? Axis.vertical : Axis.horizontal;
}
