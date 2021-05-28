//
//  CheckBoxChooseWidget.dart
//  fluttertemplet
//
//  Created by shang on 5/17/21 10:42 AM.
//  Copyright © 5/17/21 shang. All rights reserved.
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';



///单多选菜单
class CheckBoxChooseWidget extends StatefulWidget {

  var indexs = Set<int>();
  var titles = [];
  void Function(Set<int> indexs) callback;

  CheckBoxChooseWidget({
    required this.titles,
    required this.indexs,
    required this.callback,
  });

  @override
  _CheckBoxChooseWidgetState createState() => _CheckBoxChooseWidgetState();
}


class _CheckBoxChooseWidgetState extends State<CheckBoxChooseWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: -8.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        children: widget.titles.map((e) => TextButton.icon(onPressed: (){
          _changeValue(widget.titles.indexOf(e));
        },
          // icon: widget.selectedIndexs.contains(widget.titles.indexOf(e)) ? Icon(Icons.radio_button_checked_outlined) : Icon(Icons.radio_button_unchecked_outlined),
          icon: widget.indexs.contains(widget.titles.indexOf(e)) ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_outline_blank),
          label: Text(e),
          // style: OutlinedButton.styleFrom(
          //   backgroundColor: Colors.transparent,
          //   primary: widget.selectedIndexs.contains(widget.titles.indexOf(e)) ? Theme.of(context).primaryColor : Colors.black87,
          // ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            primary: Colors.black87,
          ),
        )).toList(),
      ),
    );
  }

  void _changeValue(int value) {
    setState(() {
      if (widget.indexs.contains(value)) {
        widget.indexs.remove(value);
      } else {
        widget.indexs.add(value);
      }
      widget.callback(widget.indexs);
      // DDLog(widget.indexs);
    });
  }
}
