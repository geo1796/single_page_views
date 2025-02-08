import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/nav_bar_state_controller.dart';
import 'package:single_page_views/model/nav_bar_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/nav_bar_style.dart';
import 'package:single_page_views/widgets/nav_bar_entry.dart';

class SinglePageNavBar extends StatelessWidget {
  const SinglePageNavBar({super.key});

  double get _drawerWidth => navBarStateController.isExpanded
      ? navBarStyle.expandedWidth
      : navBarStyle.collapsedWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: ValueListenableBuilder<NavBarState>(
          valueListenable: navBarStateController,
          builder: (context, drawerState, child) => Container(
            color: navBarStyle.color,
            width: _drawerWidth,
            child: Column(
                crossAxisAlignment: drawerState.isCollapsed
                    ? CrossAxisAlignment.center
                    : navBarStyle.position.isLeft
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                spacing: navBarStyle.spacing,
                children: [
                  const SizedBox.shrink(),
                  if (!fixedNavBarState)
                    InkWell(
                      onTap: navBarStateController.toggle,
                      child: drawerState.isExpanded
                          ? navBarStyle.expandedHeader
                          : navBarStyle.collapsedHeader,
                    ),
                  child!,
                ]),
          ),
          child: Column(
            spacing: navBarStyle.spacing,
            children:
                List.generate(views.length, (i) => NavEntry(view: views[i])),
          ),
        ),
      ),
    );
  }
}
