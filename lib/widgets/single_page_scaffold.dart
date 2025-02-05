import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/active_view_controller.dart';
import 'package:single_page_views/controllers/drawer_state_controller.dart';
import 'package:single_page_views/model/drawer_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/drawer_style.dart';

class SinglePageScaffold extends StatelessWidget {
  const SinglePageScaffold({super.key});

  double get _drawerWidth => drawerStateController.isExpanded
      ? drawerStyle.expandedWidth
      : drawerStyle.collapsedWidth;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DrawerState>(
      valueListenable: drawerStateController,
      builder: (context, _, child) => Positioned(
        left: _drawerWidth,
        top: 0,
        bottom: 0,
        right: 0,
        child: child!,
      ),
      child: ValueListenableBuilder<SinglePageView>(
        valueListenable: activeViewController,
        builder: (context, activeView, _) => activeView.scaffold,
      ),
    );
  }
}
