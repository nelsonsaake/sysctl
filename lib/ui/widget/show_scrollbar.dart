import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class ShowScrollbar extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 8.0,
      radius: r(10),
      child: Material(
        child: child,
      ),
    );
  }
}
