import 'package:flutter/material.dart';
import 'package:single_page_views/model/nav_bar_state.dart';

late final NavBarStateController navBarStateController;

void setNavBarStateController(NavBarStateController c) => navBarStateController = c;

class NavBarStateController extends ValueNotifier<NavBarState> {
  NavBarStateController(super.value);

  void toggle() {
    value = isExpanded ? NavBarState.collapsed : NavBarState.expanded;
    notifyListeners();
  }

  bool get isExpanded => value.isExpanded;
  bool get isCollapsed => value.isCollapsed;
}
