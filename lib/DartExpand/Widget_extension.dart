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
}