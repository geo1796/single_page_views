import 'package:flutter/widgets.dart';

late final List<SinglePageView> views;

void setViews(List<SinglePageView> l) => views = l;

late final SinglePageView initialView;

void setInitialView(SinglePageView v) => initialView = v;

class SinglePageView {
  final Widget leading;
  final Widget title;
  final Widget scaffold;

  SinglePageView({
    required this.leading,
    required this.title,
    required this.scaffold,
  });
}

