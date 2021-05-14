import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

extension WidgetExt on Widget {

  Container toContainer({
    Key? key,
    alignment,
    padding,
    color,
    decoration,
    foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    margin,
    transform,
    transformAlignment,
    child,
    clipBehavior = Clip.none,
  }) => Container(
    key: key,
    alignment: alignment,
    padding: padding,
    color: color,
    decoration: decoration,
    foregroundDecoration: foregroundDecoration,
    width: width,
    height: height,
    constraints: constraints,
    margin: margin,
    transform: transform,
    transformAlignment: transformAlignment,
    clipBehavior: clipBehavior,
    child: this,
  );


  Material toMaterial({
    Key? key,
    type = MaterialType.canvas,
    elevation = 0.0,
    color,
    shadowColor,
    textStyle,
    borderRadius,
    shape,
    borderOnForeground = true,
    clipBehavior = Clip.none,
    animationDuration = kThemeChangeDuration,
    child,
  }) => Material(
    key: key,
    type: type,
    elevation: elevation,
    color: color,
    shadowColor: shadowColor,
    textStyle: textStyle,
    borderRadius: borderRadius,
    shape: shape,
    borderOnForeground: borderOnForeground,
    clipBehavior: clipBehavior,
    animationDuration: animationDuration,
    child: this,
  );

  toShowCupertinoModalPopup({
    required BuildContext context,
    ImageFilter? filter,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool? semanticsDismissible,
    RouteSettings? routeSettings,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => this,
        filter: filter,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        semanticsDismissible: semanticsDismissible,
        routeSettings: routeSettings,
      );


  /// 时间选择器
  void showDatePicker({
    required BuildContext context,
    DateTime? initialDateTime,
    required CupertinoDatePickerMode mode,
    // required void Function(DateTime dateTime, String title) callback}) {
    required void callback(DateTime dateTime, String title)}) {

    DateTime dateTime = initialDateTime ?? DateTime.now();

    Container(
      height: 300,
      // color: Color.fromARGB(255, 255, 255, 255),
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            // Close the modal
            CupertinoButton(
              child: Text('取消'),
              // onPressed: () => Navigator.of(ctx).pop(),
              onPressed: (){
                callback(dateTime, "取消");
                Navigator.of(context).pop();
              },
            ),
            Expanded(child: Text("请选择",
              style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  backgroundColor: Colors.white,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,)
            ),

            CupertinoButton(
              child: Text('确定'),
              // onPressed: () => Navigator.of(ctx).pop(),
              onPressed: (){
                callback(dateTime, "确定");
                Navigator.of(context).pop();
              },
            ),
          ],),
          Container(
            height: 216,
            color: Colors.white,
            child: CupertinoDatePicker(
                mode: mode,
                initialDateTime: initialDateTime,
                onDateTimeChanged: (val) {
                    dateTime = val;
                    DDLog(val);
                }),
          ),
        ],
      ),
    ).toShowCupertinoModalPopup(context: context);
  }
}

extension DateTimeExt on DateTime {
  String toString19() => this.toString().split(".").first;

}

