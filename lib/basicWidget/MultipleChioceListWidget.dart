import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:styled_widget/styled_widget.dart';

import 'SingleChoiceListWidget.dart';
import 'package:fluttertemplet/DartExpand/widget_extension.dart';


///多选列表
class MultipleChioceListWidget extends StatefulWidget {
  var indexs = Set<int>();
  var items = <ChioceModel>[];
  void Function(Set<int> indexs) callback;

  final Color? containerColor;
  bool canScroll = false;

  MultipleChioceListWidget({
    required this.items,
    required this.indexs,
    required this.canScroll,
    required this.callback,
    this.containerColor,
  });

  @override
  _MultipleChioceListWidgetState createState() => _MultipleChioceListWidgetState();
}

class _MultipleChioceListWidgetState extends State<MultipleChioceListWidget> {

  @override
  Widget build(BuildContext context) {
    return widget.canScroll ? buildListViewSeparated(context) : buildListView(context);
  }

  Widget buildListView(BuildContext context) {
    return Material(
        child: Container(
            color: widget.containerColor ?? Colors.black.withAlpha(35),
            height: 73 * widget.items.length.toDouble(), // Change as per your requirement
            width: 0, // Change as per your requirement
            child: ListView(
              physics: NeverScrollableScrollPhysics(),//禁止滑动
              children: widget.items.map((e) => ListTile(
                title: e.title,
                subtitle: e.subtitle,
                trailing: widget.indexs.contains(widget.items.indexOf(e)) ? Icon(Icons.check) : null,
                selected: widget.indexs.contains(widget.items.indexOf(e)),
                onTap: (){
                  _changeValue(widget.items.indexOf(e));
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
        itemCount: widget.items.length,
        cacheExtent: 10,
        itemBuilder: (context, index) {
          final e = widget.items[index];
          return ListTile(
            title: e.title,
            subtitle: e.subtitle,
            trailing: widget.indexs.contains(widget.items.indexOf(e)) ? Icon(Icons.check) : null,
            selected: widget.indexs.contains(widget.items.indexOf(e)),
            onTap: () {
              ddlog(e);
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


  // List<Widget> buildChildren(BuildContext context) {
  //   return widget.items.map((e) => CheckboxListTile(
  //     title: e.title,
  //     subtitle: e.subtitle,
  //     selected: widget.indexs.contains(widget.items.indexOf(e)),
  //     value: widget.indexs.contains(widget.items.indexOf(e)),
  //     secondary: widget.indexs.contains(widget.items.indexOf(e)) ? Icon(Icons.check) : null,
  //     onChanged: (bool? value) {
  //       _changeValue(widget.items.indexOf(e));
  //     },
  //   )).toList();
  // }

  void _changeValue(int value) {
    setState(() {
      if (widget.indexs.contains(value)) {
        widget.indexs.remove(value);
      } else {
        widget.indexs.add(value);
      }
      widget.callback(widget.indexs);
      // ddlog(widget.indexs);
    });
  }
}
