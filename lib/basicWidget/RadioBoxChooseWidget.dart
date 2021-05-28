import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';


///单选菜单
class RadioBoxChooseWidget extends StatefulWidget {
  int index = 0;
  var titles = [];
  void Function(int index) callback;

  RadioBoxChooseWidget({
    required this.titles,
    required this.index,
    required this.callback,
  });

  @override
  _RadioBoxChooseWidgetState createState() => _RadioBoxChooseWidgetState();
}


class _RadioBoxChooseWidgetState extends State<RadioBoxChooseWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: -8.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        children: widget.titles.map((e) => TextButton.icon(onPressed: (){
          // DDLog(widget.titles.indexOf(e));
          _changeValue(widget.titles.indexOf(e));
        },
          icon: widget.titles.indexOf(e) == widget.index ? Icon(Icons.radio_button_checked_outlined) : Icon(Icons.radio_button_unchecked_outlined),
          label: Text(e),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            primary: Colors.black87,
          ),
        )).toList(),
      ),
    );
  }

  void _changeValue(int index) {
    setState(() {
      widget.index = index;
    });
    widget.callback(widget.index);
    // DDLog(widget.index);
  }
}
