

import 'dart:convert';
import 'package:flutter/material.dart';


extension PopupMenuButtonExt on PopupMenuButton{

  /// itemBuilder: <PopupMenuItem<String>>[]
  static from({ required List<String> list, void callback(String value)?}) => PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => list.map((value) => PopupMenuItem(
          child: Text(value),
          value: "${list.indexOf(value)}",
        )).toList(),
        onSelected: callback);

  /// itemBuilder: <PopupMenuButton<String>>[]
  static fromJson({required Map<String, String> json, void callback(String value)?}) => PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => json.keys.map((key) => PopupMenuItem(
          child: Text(key),
          value: json[key],
        )).toList(),
        onSelected: callback);

  /// itemBuilder: <CheckedPopupMenuItem<String>>[]
  static fromCheckList({required List<String> list, int checkedIdx = 0, void callback(String value)?}) {
    return PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => list.map((value) => CheckedPopupMenuItem<String>(
          child: Text(value),
          checked: checkedIdx == list.indexOf(value),
          value: "${list.indexOf(value)}",
        )).toList(),
        onSelected: callback);
  }

  /// itemBuilder: <CheckedPopupMenuItem<String>>[]
  static fromCheckJson({required Map<String, String> json, required String checkedString, void Function(String value)? callback}) async => PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => json.keys.map((key) => CheckedPopupMenuItem<String>(
          child: Text(key),
          checked: key == checkedString,
          value: json[key],
        )).toList(),
        onSelected: callback);

  /// itemBuilder: <PopupMenuEntry<String>>[]
  static fromEntryList({required List<String> list, required int checkedIdx, void callback(String value)?}) {
    var items = <PopupMenuEntry<String>>[];
    for (int i = 0; i < list.length; i++) {
      final String e = list[i];
      items.add(
          CheckedPopupMenuItem<String>(
            child: Text(e),
            value: e,
            checked: i == checkedIdx,
          ));
      items.add(PopupMenuDivider(height: 1.0));
    }

    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => items,
      onSelected: callback,
    );
  }
  /// itemBuilder: <PopupMenuEntry<String>>[]
  static fromEntryFromJson({required Map<String, String> json, required String checkedString, void Function(String value)? callback}) {
    var list = <PopupMenuEntry<String>>[];
    for (final String e in json.keys) {
      list.add(
          CheckedPopupMenuItem<String>(
            child: Text(e),
            checked: e == checkedString,
            value: json[e],
          ));
      list.add(PopupMenuDivider(height: 1.0));
    }

    return PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => list,
        onSelected: callback,
    );
  }

  // /// create itemBuilder: <PopupMenuItem<String>>[]
  // static List builderFromJson(Map<String, String> json, String checkedString) {
  //   return json.keys.map((key) => PopupMenuItem<String>(
  //     child: Text(key),
  //     value: json[key],
  //   )).toList();
  // }
  //
  // /// create itemBuilder: <CheckedPopupMenuItem<String>>[]
  // static List builderCheckFromJson(Map<String, String> json, String checkedString) {
  //   return json.keys.map((key) => CheckedPopupMenuItem<String>(
  //     child: Text(key),
  //     checked: key == checkedString,
  //     value: json[key],
  //   )).toList();
  // }
  //
  // /// create itemBuilder: <PopupMenuEntry<String>>[]
  // static List builderEntryFromJson(Map<String, String> json, String checkedString) {
  //   var list = <PopupMenuEntry<String>>[];
  //   for (final String e in json.keys) {
  //     list.add(
  //         CheckedPopupMenuItem<String>(
  //           child: Text(e),
  //           checked: e == checkedString,
  //           value: json[e],
  //         ));
  //     list.add(PopupMenuDivider(height: 1.0));
  //   }
  //   // DDLog(list);
  //   return list;
  // }
}




