import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

import 'RadioListChooseWidget.dart';
import 'package:fluttertemplet/DartExpand/Widget_extension.dart';


///单选列表
class CheckListChooseWidget extends StatefulWidget {
  var indexs = Set<int>();
  var models = <RadioListTileModel>[];
  void Function(Set<int> indexs) callback;

  final Color? containerColor;
  bool canScroll = false;

  CheckListChooseWidget({
    required this.models,
    required this.indexs,
    required this.canScroll,
    required this.callback,
    this.containerColor,
  });

  @override
  _CheckListChooseWidgetState createState() => _CheckListChooseWidgetState();
}

class _CheckListChooseWidgetState extends State<CheckListChooseWidget> {

  @override
  Widget build(BuildContext context) {
    return widget.canScroll ? buildListViewSeparated(context) : buildListView(context);
  }

  Widget buildListView(BuildContext context) {
    return Material(
        child: Container(
            color: widget.containerColor ?? Colors.black.withAlpha(35),
            height: 73 * widget.models.length.toDouble(), // Change as per your requirement
            width: 0, // Change as per your requirement
            child: ListView(
              physics: NeverScrollableScrollPhysics(),//禁止滑动
              children: widget.models.map((e) => ListTile(
                title: e.title,
                subtitle: e.subtitle,
                trailing: widget.indexs.contains(widget.models.indexOf(e)) ? Icon(Icons.check) : null,
                selected: widget.indexs.contains(widget.models.indexOf(e)),
                onTap: (){
                  _changeValue(widget.models.indexOf(e));
                },
              ),
              ).toList(),
            )
        )
    );
  }

  Widget buildListViewSeparated(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView.separated(
        padding: EdgeInsets.all(0),
        itemCount: widget.models.length,
        cacheExtent: 10,
        itemBuilder: (context, index) {
          final e = widget.models[index];
          return ListTile(
            title: e.title,
            subtitle: e.subtitle,
            trailing: widget.indexs.contains(widget.models.indexOf(e)) ? Icon(Icons.check) : null,
            selected: widget.indexs.contains(widget.models.indexOf(e)),
            onTap: () {
              DDLog(e);
              _changeValue(index);
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
      ).addCupertinoScrollbar(),
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
