import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/active_view_controller.dart';
import 'package:single_page_views/controllers/nav_bar_state_controller.dart';
import 'package:single_page_views/model/nav_bar_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/nav_bar_style.dart';

class NavBarEntry extends StatelessWidget {
  const NavBarEntry({
    super.key,
    required this.view,
  });
  final SinglePageView view;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => activeViewController.value = view,
      child: ValueListenableBuilder<SinglePageView>(
        valueListenable: activeViewController,
        builder: (context, activeView, child) => Opacity(
          opacity: activeView == view ? 1 : 0.5,
          child: child,
        ),
        child: navBarStyle.position.isVertical
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _children,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _children,
              ),
      ),
    );
  }

  List<Widget> get _children => [
        view.leading,
        ValueListenableBuilder<NavBarState>(
            valueListenable: navBarStateController,
            builder: (context, drawerState, _) {
              if (drawerState.isCollapsed) return const SizedBox.shrink();

              final heigth = navBarStyle.position.isVertical
                  ? null
                  : navBarStyle.expandedThickness -
                      navBarStyle.collapsedThickness;

              final width = navBarStyle.position.isHorizontal
                  ? null
                  : navBarStyle.expandedThickness -
                      navBarStyle.collapsedThickness;

              return SizedBox(
                height: heigth,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [view.title],
                ),
              );
            })
      ];
}
