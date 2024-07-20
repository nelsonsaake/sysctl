import 'package:flutter/material.dart';

class Div extends StatelessWidget {
  //...

  final Widget? child;
  final VoidCallback? onTap;

  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const Div({
    super.key,
    this.child,
    this.onTap,
    this.padding,
    this.margin,
  });

  bool get isActionProvided => onTap != null;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isActionProvided ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding,
          margin: margin,
          child: child,
        ),
      ),
    );
  }
}
