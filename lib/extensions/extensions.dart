import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget viewPadding({double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }
}

extension StringExtensions on String {
  String toCapitalize() => isNotEmpty ?'${this[0].toUpperCase()}${substring(1)}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.toCapitalize()).join(" ");
}
