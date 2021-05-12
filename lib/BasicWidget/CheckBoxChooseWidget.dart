import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';



///单多选菜单
class CheckBoxChooseWidget extends StatefulWidget {

  var selectedIndexs = Set<Object?>();
  var titles = [];

  CheckBoxChooseWidget({
    required this.titles,
    required this.selectedIndexs,
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
          icon: widget.selectedIndexs.contains(widget.titles.indexOf(e)) ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_outline_blank),
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

  void _changeValue(Object? value) {
    setState(() {
      if (widget.selectedIndexs.contains(value)) {
        widget.selectedIndexs.remove(value);
      } else {
        widget.selectedIndexs.add(value);
      }
      DDLog(widget.selectedIndexs);
    });
  }
}
