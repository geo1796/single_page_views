import 'package:flutter/material.dart';

late final DrawerStyle drawerStyle;

void setDrawerStyle(DrawerStyle s) => drawerStyle = s;

class DrawerStyle {
  final Color color;
  final double spacing;
  final double expandedWidth;
  final double collapsedWidth;
  final Widget expandedHeader;
  final Widget collapsedHeader;

  const DrawerStyle({
    this.color = Colors.blue,
    this.spacing = 25.0,
    this.expandedWidth = 150.0,
    this.collapsedWidth = 50.0,
    this.expandedHeader = const Icon(Icons.arrow_back_ios, color: Colors.white),
    this.collapsedHeader =
        const Icon(Icons.arrow_forward_ios, color: Colors.white),
  });
}
