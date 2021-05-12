import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'DDLog.dart';


extension CupertinoActionSheetExt on CupertinoActionSheet{

  void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  static void showModalPopup({
    required BuildContext context,
    required String title,
    String? message,
    required List<String> actionTitles,
    List<Widget>? actionWidgets,
    required void Function(String value) callback}){
    CupertinoActionSheet(
        title: Text(title),
        message: Text(message ?? "", textAlign: TextAlign.center,),
        actions: actionWidgets ?? actionTitles.map((e) => CupertinoActionSheetAction(onPressed: (){
          callback(e);
          Navigator.pop(context);
        }, child: Text(e),)).toList(),
        cancelButton: CupertinoActionSheetAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    ).show(context)
    ;
  }

  static void showModalPopupWidgets({
    required BuildContext context,
    required String title,
    String? message,
    required List<Widget> actionWidgets}){
    CupertinoActionSheet(
      title: Text(title),
      message: Text(message ?? "", textAlign: TextAlign.start,),
      actions: actionWidgets.map((e) => Material(
        type: MaterialType.transparency,
        child: e,
      ),
      ).toList(),
      cancelButton: CupertinoActionSheetAction(
        child: Text('取消'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ).show(context)
    ;
  }

  // static void showModalPopup({
  //   required BuildContext context,
  //   required String title,
  //   String? message,
  //   required List<String> actionTitles,
  //   required void Function(String value) callback}){
  //   CupertinoActionSheet(
  //       title: Text(title),
  //       message: Text(message ?? ""),
  //       actions: actionTitles.map((e) => CupertinoActionSheetAction(onPressed: (){
  //         if (["Cancel", "取消"].contains(e)) {
  //           Navigator.pop(context);
  //         }
  //         callback(e);
  //       }, child: Text(e),)).toList()
  //
  //   ).show(context)
  //   ;
  // }

  // static void showModalPopup({
  //   required BuildContext context,
  //   required String title,
  //   String? message,
  //   required List<String> actionTitles,
  //   required void Function(String value) callback}){
  //   CupertinoActionSheet(
  //       title: Text('Select Option'),
  //       message: Text('Which option?'),
  //       actions: <Widget>[
  //         CupertinoActionSheetAction(
  //           child: Text('1'),
  //           onPressed: () {
  //             print('pressed');
  //           },
  //         )
  //       ],
  //       cancelButton: CupertinoActionSheetAction(
  //         child: Text('Cancel'),
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //       )
  //   ).show(context)
  //   ;
  // }
}