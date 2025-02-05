import 'package:flutter/material.dart';
import 'package:single_page_views/model/drawer_state.dart';

late final DrawerStateController drawerStateController;

void setDrawerStateController(DrawerStateController c) => drawerStateController = c;

class DrawerStateController extends ValueNotifier<DrawerState> {
  DrawerStateController(super.value);

  void toggle() {
    value = isExpanded ? DrawerState.collapsed : DrawerState.expanded;
    notifyListeners();
  }

  bool get isExpanded => value.isExpanded;
  bool get isCollapsed => value.isCollapsed;
}
