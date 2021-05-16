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
  void showBottomPicker({
    required BuildContext context,
    double? height,
    required Widget child,
    required void callback(String title)}) {

    final title = "请选择";
    final actionTitles = ['取消', '确定'];

    Container(
      height: height ?? 300,
      // color: Color.fromARGB(255, 255, 255, 255),
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            // Close the modal
            CupertinoButton(
              child: Text(actionTitles[0]),
              // onPressed: () => Navigator.of(ctx).pop(),
              onPressed: (){
                callback(actionTitles[0]);
                Navigator.of(context).pop();
              },
            ),
            Expanded(child: Text(title,
              style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  backgroundColor: Colors.white,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,)
            ),

            CupertinoButton(
              child: Text(actionTitles[1]),
              // onPressed: () => Navigator.of(ctx).pop(),
              onPressed: (){
                callback(actionTitles[1]);
                Navigator.of(context).pop();
              },
            ),
          ],),
          Container(
            height: 216,
            color: Colors.white,
            child: child,
          ),
        ],
      ),
    ).toShowCupertinoModalPopup(context: context);
  }

  /// 时间选择器
  void showDatePicker({
    required BuildContext context,
    DateTime? initialDateTime,
    CupertinoDatePickerMode? mode,
    // required void Function(DateTime dateTime, String title) callback}) {
    required void callback(DateTime dateTime, String title)}) {

    DateTime dateTime = initialDateTime ?? DateTime.now();

    final title = "请选择";
    final actionTitles = ['取消', '确定'];

    Container(
      height: 300,
      // color: Color.fromARGB(255, 255, 255, 255),
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            // Close the modal
            CupertinoButton(
              child: Text(actionTitles[0]),
              // onPressed: () => Navigator.of(ctx).pop(),
              onPressed: (){
                callback(dateTime, actionTitles[0]);
                Navigator.of(context).pop();
              },
            ),
            Expanded(child: Text(title,
              style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  backgroundColor: Colors.white,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,)
            ),

            CupertinoButton(
              child: Text(actionTitles[1]),
              // onPressed: () => Navigator.of(ctx).pop(),
              onPressed: (){
                callback(dateTime, actionTitles[1]);
                Navigator.of(context).pop();
              },
            ),
          ],),
          Container(
            height: 216,
            color: Colors.white,
            child: CupertinoDatePicker(
                mode: mode ?? CupertinoDatePickerMode.dateAndTime,
                initialDateTime: initialDateTime,
                onDateTimeChanged: (val) {
                  dateTime = val;
                  // DDLog(val);
                }),
          ),
        ],
      ),
    ).toShowCupertinoModalPopup(context: context);
  }


  /// 列表选择器
  void showPickerList({
    required BuildContext context,
    required List<Widget> children,
    required void callback(int index, String title)}) {

    int selectedIndex = 0;

    showBottomPicker(context: context,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 30,
          scrollController: FixedExtentScrollController(initialItem: 1),
          children: children,
          onSelectedItemChanged: (value) {
            selectedIndex = value;
          },
        ),
        callback: (title){
          callback(selectedIndex, title);
          DDLog([selectedIndex, title]);
        });
  }
}

extension DateTimeExt on DateTime {
  String toString19() => this.toString().split(".").first;

}

