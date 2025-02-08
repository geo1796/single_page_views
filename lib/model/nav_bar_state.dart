late final NavBarState initialNavBarState;

void setInitialNavBarState(NavBarState s) => initialNavBarState = s;

late final bool fixedNavBarState;

void setFixedNavBarState(bool b) => fixedNavBarState = b;

enum NavBarState {
  expanded,
  collapsed;

  bool get isExpanded => this == NavBarState.expanded;

  bool get isCollapsed => this == NavBarState.collapsed;
}
