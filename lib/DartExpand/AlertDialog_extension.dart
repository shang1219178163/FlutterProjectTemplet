
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';


extension AlertDialogExt on AlertDialog{
  ///showDialog
  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  ///按平台弹出不同样式
  static void showAlert({
    required BuildContext context,
    Widget? title,
    Widget? content,
    required List<String> actionTitles,
    required void Function(String value) callback}) {

    switch(Platform.operatingSystem) {
      case "android":
        AlertDialog(
          title: title,
          content: content,
          actions: actionTitles.map((e) => TextButton(onPressed: (){
            callback(e);
          }, child: Text(e),)).toList()
          ,
        )
            .show(context);

        break;
      default:

        CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actionTitles.map((e) => TextButton(onPressed: (){
            callback(e);
          }, child: Text(e),)).toList()
          ,
        )
            .show(context);
        break;
    }

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

}


