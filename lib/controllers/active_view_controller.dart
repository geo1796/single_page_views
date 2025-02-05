import 'package:flutter/material.dart';
import 'package:single_page_views/model/single_page_view.dart';

late final ActiveViewController activeViewController;

void setActiveViewController(ActiveViewController c) =>
    activeViewController = c;

class ActiveViewController extends ValueNotifier<SinglePageView> {
  ActiveViewController(super.value);
}
