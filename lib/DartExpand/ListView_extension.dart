
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';


extension ListViewExt on ListView{

  // CupertinoScrollbar addCupertinoScrollbar() => CupertinoScrollbar(child: this);

  CupertinoScrollbar addCupertinoScrollbar({
    Key? key,
    ScrollController? controller,
    bool isAlwaysShown = false,
    double thickness = CupertinoScrollbar.defaultThickness,
    thicknessWhileDragging = CupertinoScrollbar.defaultThicknessWhileDragging,
    Radius radius = CupertinoScrollbar.defaultRadius,
    radiusWhileDragging = CupertinoScrollbar.defaultRadiusWhileDragging,
    ScrollNotificationPredicate? notificationPredicate,
  }) =>
      CupertinoScrollbar(
        key: key,
        child: this,
        controller: controller,
        isAlwaysShown: isAlwaysShown,
        thickness: thickness,
        radius: radius,
        notificationPredicate: notificationPredicate ?? defaultScrollNotificationPredicate,
      );
}