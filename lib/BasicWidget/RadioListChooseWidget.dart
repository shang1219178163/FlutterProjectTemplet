import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';


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
  Object selectedIndex = 0;
  var models = <RadioListTileModel>[];

  RadioListChooseWidget({
    required this.models,
    required this.selectedIndex,
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
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.models.map((e) => RadioListTile(
          value: widget.models.indexOf(e),
          onChanged: (value) {
            _changeValue(value);
          },
          groupValue: widget.selectedIndex,
          title: e.title,
          subtitle: e.subtitle,
          secondary: e.secondary,
          selected: widget.selectedIndex == widget.models.indexOf(e),
        ),).toList(),
      ),
    );
  }

  void _changeValue(Object? value){
    if (value == null) {
      return;
    }
    setState(() {
      widget.selectedIndex = value;
    });
    DDLog(widget.selectedIndex);
  }
}