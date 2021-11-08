import 'package:flutter/cupertino.dart';

double screenWidth(BuildContext context, {double? dividedBy}) {
  var width = MediaQuery.of(context).size.width;
  return dividedBy == null ? width : width / dividedBy;
}
