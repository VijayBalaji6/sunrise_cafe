import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key, required this.titleWidget, required this.childWidget});

  final Widget titleWidget;
  final List<Widget> childWidget;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        shape: Border.all(color: Colors.transparent, width: 0),
        collapsedShape: Border.all(color: Colors.transparent, width: 0),
        maintainState: true,
        iconColor: Colors.teal,
        collapsedIconColor: Colors.teal,
        initiallyExpanded: true,
        title: titleWidget,
        children: childWidget);
  }
}
