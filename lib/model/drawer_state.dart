late final DrawerState initialDrawerState;

void setInitialDrawerState(DrawerState s) => initialDrawerState = s;

late final bool fixedDrawerState;

void setFixedDrawerState(bool b) => fixedDrawerState = b;

enum DrawerState {
  expanded,
  collapsed;

  bool get isExpanded => this == DrawerState.expanded;

  bool get isCollapsed => this == DrawerState.collapsed;
}
