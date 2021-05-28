//
//  RadioListChooseWidget.dart
//  fluttertemplet
//
//  Created by shang on 5/28/21 8:31 PM.
//  Copyright © 5/28/21 shang. All rights reserved.
//



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/DartExpand/Widget_extension.dart';


class RadioListTileModel{

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display on the opposite side of the tile from the radio button.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// Whether to render icons and text in the [activeColor].
  ///
  /// No effort is made to automatically coordinate the [selected] state and the
  /// [checked] state. To have the list tile appear selected when the radio
  /// button is the selected radio button, set [selected] to true when [value]
  /// matches [groupValue].
  ///
  /// Normally, this property is left to its default value, false.
  final bool selected;

  const RadioListTileModel({
    required this.title,
    required this.subtitle,
    required this.secondary,
    required this.selected,
  });
}

///单选列表
class RadioListChooseWidget extends StatefulWidget {
  var models = <RadioListTileModel>[];
  Object index = 0;
  void Function(Object index) callback;

  bool canScroll = false;

  RadioListChooseWidget({
    required this.models,
    required this.index,
    required this.canScroll,
    required this.callback,
  });

  @override
  _RadioListChooseWidgetState createState() => _RadioListChooseWidgetState();
}


class _RadioListChooseWidgetState extends State<RadioListChooseWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.canScroll ? buildListViewSeparated(context) : buildColumn(context);
  }

  ///单选 Column
  Widget buildColumn(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.models.map((e) => RadioListTile(
          value: widget.models.indexOf(e),
          onChanged: (value) {
            _changeValue(value);
          },
          groupValue: widget.index,
          title: e.title,
          subtitle: e.subtitle,
          secondary: e.secondary,
          selected: widget.index == widget.models.indexOf(e),
        ),).toList(),
      ),
    );
  }


  ///单选滚动列表
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
            trailing: index == widget.index ? Icon(Icons.check) : null,
            selected: widget.index == widget.models.indexOf(e),
            onTap: () {
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

  void _changeValue(Object? value){
    if (value == null) {
      return;
    }
    setState(() {
      widget.index = value;
    });
    widget.callback(widget.index);
    // DDLog(widget.selectedIndex);
  }
}