enum NavBarPosition {
  left,
  top,
  right,
  bottom;

  bool get isLeft => this == NavBarPosition.left;
  bool get isTop => this == NavBarPosition.top;
  bool get isRight => this == NavBarPosition.right;
  bool get isBottom => this == NavBarPosition.bottom;
}
