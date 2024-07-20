import 'package:flutter/material.dart';

class NavigationStackObserver extends NavigatorObserver {
  //...

  static List<Route> stack = [];

  @override
  void didPop(Route route, Route? previousRoute) {
    stack.removeLast();
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    stack.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    stack.remove(route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    stack.removeLast();
    if (newRoute != null) stack.add(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
