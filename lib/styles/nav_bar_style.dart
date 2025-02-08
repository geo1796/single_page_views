import 'package:flutter/material.dart';
import 'package:single_page_views/model/nav_bar_position.dart';
import 'package:single_page_views/widgets/icon_expand_right.dart';
import 'package:single_page_views/widgets/icon_expand_left.dart';

late final NavBarStyle navBarStyle;

void setNavBarStyle(NavBarStyle s) => navBarStyle = s;

class NavBarStyle {
  final Color color;
  final Color headerColor;
  final double spacing;
  final double expandedWidth;
  final double collapsedWidth;
  final NavBarPosition position;
  final Widget? customExpandedHeader;
  final Widget? customCollapsedHeader;

  const NavBarStyle({
    this.color = Colors.blue,
    this.headerColor = Colors.white,
    this.spacing = 25.0,
    this.expandedWidth = 150.0,
    this.collapsedWidth = 50.0,
    this.position = NavBarPosition.left,
    this.customExpandedHeader,
    this.customCollapsedHeader,
  });

  Widget get expandedHeader {
    if (customExpandedHeader != null) {
      return customExpandedHeader!;
    }

    switch (position) {
      case NavBarPosition.left:
        return IconExpandLeft(color: headerColor);
      case NavBarPosition.top:
        return Icon(Icons.expand_less, color: headerColor);
      case NavBarPosition.right:
        return IconExpandRight(color: headerColor);
      case NavBarPosition.bottom:
        return Icon(Icons.expand_more, color: headerColor);
    }
  }

  Widget get collapsedHeader {
    if (customExpandedHeader != null) {
      return customExpandedHeader!;
    }

    switch (position) {
      case NavBarPosition.left:
        return IconExpandRight(color: headerColor);
      case NavBarPosition.top:
        return Icon(Icons.expand_more, color: headerColor);
      case NavBarPosition.right:
        return IconExpandLeft(color: headerColor);
      case NavBarPosition.bottom:
        return Icon(Icons.expand_less, color: headerColor);
    }
  }
}
