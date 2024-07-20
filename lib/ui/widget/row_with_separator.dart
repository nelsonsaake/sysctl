import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class RowWithSeparator extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  const RowWithSeparator({
    super.key,
    this.children = const [],
    this.separator = const Space8(),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();

    List<Widget> childrenWithSeparators = [];
    for (int i = 0; i < children.length; i++) {
      childrenWithSeparators.add(children[i]);
      if (i != children.length - 1) {
        childrenWithSeparators.add(separator);
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: childrenWithSeparators,
    );
  }
}
