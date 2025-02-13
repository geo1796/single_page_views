import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/nav_bar_state_controller.dart';
import 'package:single_page_views/model/nav_bar_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/nav_bar_style.dart';
import 'package:single_page_views/widgets/nav_bar_entry.dart';

class HorizontalNavBar extends StatelessWidget {
  const HorizontalNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: ValueListenableBuilder<NavBarState>(
        valueListenable: navBarStateController,
        builder: (_, navBarState, child) => Container(
          color: navBarStyle.color,
          height: navBarState.isExpanded
              ? navBarStyle.expandedThickness
              : navBarStyle.collapsedThickness,
          child: Stack(
            alignment: navBarStyle.position.isTop
                ? Alignment.bottomCenter
                : Alignment.topCenter,
            children: [
              child!,
              if (!fixedNavBarState)
                InkWell(
                  onTap: navBarStateController.toggle,
                  child: navBarState.isExpanded
                      ? navBarStyle.expandedHeader
                      : navBarStyle.collapsedHeader,
                ),
            ],
          ),
        ),
        child: Row(
          spacing: navBarStyle.spacing,
          children: [
            const SizedBox.shrink(),
            ...List.generate(views.length, (i) => NavBarEntry(view: views[i]))
          ],
        ),
      ),
    ));
  }
}
