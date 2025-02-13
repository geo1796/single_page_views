import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/active_view_controller.dart';
import 'package:single_page_views/controllers/nav_bar_state_controller.dart';
import 'package:single_page_views/model/nav_bar_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/nav_bar_style.dart';

class SinglePageScaffold extends StatelessWidget {
  const SinglePageScaffold({super.key});

  double get _drawerWidth => navBarStateController.isExpanded
      ? navBarStyle.expandedThickness
      : navBarStyle.collapsedThickness;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<NavBarState>(
      valueListenable: navBarStateController,
      builder: (context, _, child) => Positioned(
        left: navBarStyle.position.isLeft ? _drawerWidth : 0,
        top: navBarStyle.position.isTop ? _drawerWidth : 0,
        bottom: navBarStyle.position.isBottom ? _drawerWidth : 0,
        right: navBarStyle.position.isRight ? _drawerWidth : 0,
        child: child!,
      ),
      child: ValueListenableBuilder<SinglePageView>(
        valueListenable: activeViewController,
        builder: (context, activeView, _) => activeView.scaffold,
      ),
    );
  }
}
