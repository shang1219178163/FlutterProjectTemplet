import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/DartExpand/Widget_extension.dart';

extension ActionSheetExt on BottomSheet{
  ///showModalBottomSheet
  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  ///自定义sheet弹窗方法
  static void showModalSheet({
    required BuildContext context,
    required String title,
    String? message,
    required List<String> actionTitles,
    List<Widget>? actionWidgets,
    required void Function(String value) callback}){

    var listView = Container(
      height: 300,
      child: ListView.separated(
        itemCount: actionTitles.length,
        itemBuilder: (context, index) {
          final e = actionTitles[index];
          return ListTile(
            title: Text(e),
            subtitle: null,
            onTap: (){
              callback(e);
              Navigator.pop(context);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: .5,
            indent: 15,
            endIndent: 15,
            color: Color(0xFFDDDDDD),
          );
        },
      ),
    );

    var list = actionWidgets ?? [listView];
    list.insertAll(0, [
        // Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), textAlign: TextAlign.start,),
        Text(message ?? "", textAlign: TextAlign.start,),
      ],
    );

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min, // 设置最小的弹出
          children:[
            Row(children: [
              TextButton(onPressed: (){
                    DDLog("Done");
                  },
                  child: Text("取消", style: TextStyle(color: Colors.black87),)
              ),
              Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), textAlign: TextAlign.center,).expanded(),
              TextButton(onPressed: (){
                    DDLog("Done");
                  },
                  child: Text("确定", style: TextStyle(color: Colors.black87,)),
                  // child: IconButton(onPressed: () {  },
                  //   padding: EdgeInsets.all(0.0),
                  //   iconSize: 20.0,
                  //   icon: Icon(Icons.close),),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min, // 设置最小的弹出
            children:list,
          ),
        ]);
      },
    );
  }
}

extension CupertinoActionSheetExt on CupertinoActionSheet{
  ///showCupertinoModalPopup
  void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
  
}



