import 'package:flutter/material.dart';
import 'package:single_page_views/controllers/active_view_controller.dart';
import 'package:single_page_views/controllers/drawer_state_controller.dart';
import 'package:single_page_views/model/drawer_state.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/styles/drawer_style.dart';
import 'package:single_page_views/widgets/single_page_drawer.dart';
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
  DrawerState initialDrawerState = DrawerState.collapsed,
  bool fixedDrawerState = false,
  DrawerStyle drawerStyle = const DrawerStyle(),
}) {
  if (views.isEmpty) {
    throw Exception('views cannot be empty');
  }

  setViews(views);

  setInitialView(initialView ?? views[0]);

  setActiveViewController(ActiveViewController(initialView ?? views[0]));

  setInitialDrawerState(initialDrawerState);

  setFixedDrawerState(fixedDrawerState);

  setDrawerStyle(drawerStyle);

  setDrawerStateController(DrawerStateController(initialDrawerState));

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
      children: [
        SinglePageScaffold(),
        SinglePageDrawer(),
      ],
    );
  }
}
