import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

import 'RadioListChooseWidget.dart';


///单选列表
class CheckListChooseWidget extends StatefulWidget {
  var indexs = Set<int>();
  var models = <RadioListTileModel>[];
  void Function(Set<int> indexs) callback;

  final Color? containerColor;

  CheckListChooseWidget({
    required this.models,
    required this.indexs,
    required this.callback,
    this.containerColor,
  });

  @override
  _CheckListChooseWidgetState createState() => _CheckListChooseWidgetState();
}

class _CheckListChooseWidgetState extends State<CheckListChooseWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: widget.containerColor ?? Colors.black.withAlpha(35),
          height: 73 * widget.models.length.toDouble(), // Change as per your requirement
          width: 0, // Change as per your requirement
          child: ListView(
      children: widget.models.map((e) => ListTile(
        title: e.title,
        subtitle: e.subtitle,
        // trailing: widget.selectedIndexs.contains(widget.models.indexOf(e)) ? Icon(Icons.check) : Icon(Icons.check_box_outline_blank),
        trailing: widget.indexs.contains(widget.models.indexOf(e)) ? Icon(Icons.check) : null,
        selected: widget.indexs.contains(widget.models.indexOf(e)),
        // dense: true,
        onTap: (){
          _changeValue(widget.models.indexOf(e));
        },
      ),).toList(),
    ))
    );
    return Material(
      color: Colors.transparent,
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: -8.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        children:  widget.models.map((e) => ListTile(
          title: e.title,
          subtitle: e.subtitle,
          trailing: widget.indexs.contains(widget.models.indexOf(e)) ? Icon(Icons.check) : Icon(Icons.check_box_outline_blank),
        ),).toList()
        ,
        // children: widget.titles.map((e) => TextButton.icon(onPressed: (){
        //   _changeValue(widget.titles.indexOf(e));
        // },
        //   // icon: widget.selectedIndexs.contains(widget.titles.indexOf(e)) ? Icon(Icons.radio_button_checked_outlined) : Icon(Icons.radio_button_unchecked_outlined),
        //   icon: widget.selectedIndexs.contains(widget.titles.indexOf(e)) ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_outline_blank),
        //   label: Text(e),
        //   style: OutlinedButton.styleFrom(
        //     backgroundColor: Colors.transparent,
        //     primary: widget.selectedIndexs.contains(widget.titles.indexOf(e)) ? Theme.of(context).primaryColor : Colors.black87,
        //   ),
        // )).toList(),
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
