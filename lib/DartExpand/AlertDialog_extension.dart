
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';


extension AlertDialogExt on AlertDialog{

  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  static void showAlert({
    required BuildContext context,
    required String title,
    String? message,
    required List<String> actionTitles,
    required void Function(String value) callback}) {

    switch(Platform.operatingSystem) {
      case "android":
        AlertDialogExt.showAlertDialog(context: context, title: title, message: message, actionTitles: actionTitles, callback: callback);
        break;
      default:
        CupertinoAlertDialogExt.showAlertDialog(context: context, title: title, message: message, actionTitles: actionTitles, callback: callback);
        break;
    }
  }

  static void showAlertDialog({
    required BuildContext context,
    required String title,
    String? message,
    required List<String> actionTitles,
    required void Function(String value) callback}){
    AlertDialog(
      title: Text(title),
      content: Text(message ?? "").textAlignment(TextAlign.start),
      actions: actionTitles.map((e) => TextButton(onPressed: (){
        // if (["Cancel", "取消"].contains(e)) {
        //   Navigator.pop(context);
        // }
        callback(e);
        Navigator.pop(context);
      }, child: Text(e),)).toList()
      ,
    )
        .show(context)
    ;
  }
}


extension CupertinoAlertDialogExt on CupertinoAlertDialog{

  ///showDialog
  void show(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required String title,
    String? message,
    required List<String> actionTitles,
    required void Function(String value) callback}){

    CupertinoAlertDialog(
      title: Text(title),
      content: Text(message ?? "").textAlignment(TextAlign.start),
      actions: actionTitles.map((e) => TextButton(onPressed: (){
        // if (["Cancel", "取消"].contains(e)) {
        //   Navigator.pop(context);
        // }
        callback(e);
        Navigator.pop(context);
      }, child: Text(e),)).toList()
        ,
    )
        .show(context)
    ;
  }

  static void showAlertDialogContentWidget({
    required BuildContext context,
    required String title,
    required Widget content,
    required List<String> actionTitles,
    required void Function(String value) callback}){

    CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: actionTitles.map((e) => TextButton(onPressed: (){
        // if (["Cancel", "取消"].contains(e)) {
        //   Navigator.pop(context);
        // }
        callback(e);
        Navigator.pop(context);
      }, child: Text(e),)).toList()
      ,
    )
        .show(context)
    ;
  }
}


