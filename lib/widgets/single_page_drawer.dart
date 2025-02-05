import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/drawer_state_controller.dart';
import 'package:single_page_views/model/drawer_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/drawer_style.dart';
import 'package:single_page_views/widgets/drawer_entry.dart';

class SinglePageDrawer extends StatelessWidget {
  const SinglePageDrawer({super.key});

  double get _drawerWidth => drawerStateController.isExpanded
      ? drawerStyle.expandedWidth
      : drawerStyle.collapsedWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: ValueListenableBuilder<DrawerState>(
          valueListenable: drawerStateController,
          builder: (context, drawerState, child) => Container(
            color: drawerStyle.color,
            width: _drawerWidth,
            child: Column(
                crossAxisAlignment: drawerState.isExpanded
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.center,
                spacing: drawerStyle.spacing,
                children: [
                  const SizedBox.shrink(),
                  if (!fixedDrawerState)
                    InkWell(
                      onTap: drawerStateController.toggle,
                      child: drawerState.isExpanded
                          ? drawerStyle.expandedHeader
                          : drawerStyle.collapsedHeader,
                    ),
                  child!,
                ]),
          ),
          child: Column(
            spacing: drawerStyle.spacing,
            children: List.generate(
                views.length, (i) => DrawerEntry(view: views[i])),
          ),
        ),
      ),
    );
  }
}
