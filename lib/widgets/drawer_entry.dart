import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/active_view_controller.dart';
import 'package:single_page_views/controllers/drawer_state_controller.dart';
import 'package:single_page_views/model/drawer_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/drawer_style.dart';

class DrawerEntry extends StatelessWidget {
  const DrawerEntry({
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            view.leading,
            ValueListenableBuilder<DrawerState>(
                valueListenable: drawerStateController,
                builder: (context, drawerState, _) {
                  if (drawerState.isCollapsed) return const SizedBox.shrink();

                  return SizedBox(
                    width:
                        drawerStyle.expandedWidth - drawerStyle.collapsedWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [view.title],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
