import 'package:devpanel/app/app.router.dart';
import 'package:devpanel/viewmodels/context_viewmodel.dart';
import 'package:flutter/material.dart';

class LayoutViewmodel extends ContextViewModel {
  //...

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() => scaffoldKey.currentState?.openDrawer();

  void closeDrawer() => scaffoldKey.currentState?.openDrawer();

  static const drawerRoutes = {
    "Dynos": Routes.dynosView,
    "Run": Routes.runView,
  };

  void navigateTo(String route) {
    nav.navigateTo(route);
    closeDrawer();
  }
}
