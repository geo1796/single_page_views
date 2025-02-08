import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/active_view_controller.dart';
import 'package:single_page_views/controllers/nav_bar_state_controller.dart';
import 'package:single_page_views/model/nav_bar_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/nav_bar_style.dart';
import 'package:single_page_views/widgets/single_page_nav_bar.dart';
import 'package:single_page_views/widgets/single_page_scaffold.dart';

late final bool _initialized;

bool get isInitialized {
  try {
    return _initialized;
  } catch (_) {
    return false;
  }
}

SinglePageViews buildSinglePageViews(
  List<SinglePageView> views, {
  SinglePageView? initialView,
  NavBarState initialDrawerState = NavBarState.collapsed,
  bool fixedDrawerState = false,
  NavBarStyle navBarStyle = const NavBarStyle(),
}) {
  if (views.isEmpty) {
    throw Exception('views cannot be empty');
  }

  setViews(views);

  setInitialView(initialView ?? views[0]);

  setActiveViewController(ActiveViewController(initialView ?? views[0]));

  setInitialNavBarState(initialDrawerState);

  setFixedNavBarState(fixedDrawerState);

  setNavBarStyle(navBarStyle);

  setNavBarStateController(NavBarStateController(initialDrawerState));

  _initialized = true;

  return SinglePageViews();
}

class SinglePageViews extends StatelessWidget {
  const SinglePageViews({super.key});

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      throw Exception(
          'don\'t use constructor of SinglePageViews: call `buildSinglePageViews` instead');
    }

    return Stack(
      alignment: navBarStyle.position.isLeft
          ? AlignmentDirectional.topStart
          : AlignmentDirectional.topEnd,
      children: [
        SinglePageScaffold(),
        SinglePageNavBar(),
      ],
    );
  }
}
