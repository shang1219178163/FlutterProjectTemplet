
//
//  SegmentControlDemoPage.dart
//  fluttertemplet
//
//  Created by shang on 6/4/21 10:54 AM.
//  Copyright © 6/4/21 shang. All rights reserved.
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

class SegmentControlDemoPage extends StatefulWidget {

  final String? title;

  SegmentControlDemoPage({ Key? key, this.title}) : super(key: key);


  @override
  _SegmentControlDemoPageState createState() => _SegmentControlDemoPageState();
}

class _SegmentControlDemoPageState extends State<SegmentControlDemoPage> {


  int groupValue = 0;


  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "$widget"),
        bottom: buildPreferredSize(context),
      ),
      body: buildListView(context),

    );
  }


  PreferredSizeWidget buildPreferredSize(BuildContext context) {
    return
      PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 24),
                Expanded(
                  child: CupertinoSegmentedControl(
                    children: const <int, Widget>{
                      0: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Midnight', style: TextStyle(fontSize: 15))),
                      1: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Viridian', style: TextStyle(fontSize: 15))),
                      2: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Cerulean', style: TextStyle(fontSize: 15)))
                    },
                    groupValue: groupValue,
                    onValueChanged: (value) {
                      // TODO: - fix it
                      DDLog(value.runtimeType);
                      DDLog(value.toString());
                      setState(() {
                        groupValue = int.parse("$value");
                      });
                    },
                    borderColor: Colors.white,

                    //   selectedColor: Colors.redAccent,
                    // unselectedColor: Colors.green,
                  ),
                ),
                SizedBox(width: 24)
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 48));
  }

  Widget buildListView(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 15),
        buildSegmentedControl(context),

        SizedBox(height: 15),
        buildSlidingSegmentedControl(context).padding(left: 15, right: 15),

        SizedBox(height: 15),
        buildSlidingSegmentedControl2(context).padding(left: 15, right: 15),

        SizedBox(height: 15),
        buildSlidingSegmentedControl3(context).padding(left: 15, right: 15),
      ],
    );
  }


  final Map<int, Widget> children = <int, Widget>{
    0: Container(
      padding: EdgeInsets.all(8),
      child: Text(
          "Item 1", style: TextStyle(fontSize: 15, color: Colors.black)),
    ),
    1: Container(
      padding: EdgeInsets.all(8),
      child: Text(
          "Item 2", style: TextStyle(fontSize: 15, color: Colors.black)),
    ),
    2: Container(
      padding: EdgeInsets.all(8),
      child: Text(
          "Item 3", style: TextStyle(fontSize: 15, color: Colors.black)),
    ),
  };



  Widget buildSegmentedControl(BuildContext context) {
    return CupertinoSegmentedControl<int>(
      children: children,
      onValueChanged: (int newValue) {
        setState(() {
          groupValue = newValue;
        });
        DDLog(groupValue);
      },
      groupValue: groupValue,
      borderColor: Colors.white,
    );
  }

  Widget buildSlidingSegmentedControl(BuildContext context) {
    final Map<int, Widget> children = const <int, Widget>{
      0: Text("Item 1", style: TextStyle(fontSize: 15),),
      1: Text("Item 2", style: TextStyle(fontSize: 15),),
      2: Text("Item 3", style: TextStyle(fontSize: 15),),
    };

    return CupertinoSlidingSegmentedControl(
      groupValue: groupValue,
      children: children,
      onValueChanged: (i) {
        setState(() {
          groupValue = int.parse("$i");
        });
        DDLog(groupValue);
      },
      // backgroundColor: Colors.transparent,
    );
  }


  Widget buildSlidingSegmentedControl2(BuildContext context) {
    final Map<int, Widget> children = const <int, Widget>{
      0: Text("Item 1", style: TextStyle(fontSize: 15),),
      1: Text("Item 2", style: TextStyle(fontSize: 15),),
      2: Text("Item 3", style: TextStyle(fontSize: 15),),
    };

    return CupertinoSlidingSegmentedControl(
      groupValue: groupValue,
      children: children,
      onValueChanged: (i) {
        setState(() {
          groupValue = int.parse("$i");
        });
        DDLog(groupValue);
      },
      thumbColor: Colors.orangeAccent,
      // backgroundColor: Colors.transparent,
    );
  }

  Widget buildSlidingSegmentedControl3(BuildContext context) {
    final Map<int, Widget> children = const <int, Widget>{
      0: Text("Item 1", style: TextStyle(fontSize: 15),),
      1: Text("Item 2", style: TextStyle(fontSize: 15),),
      2: Text("Item 3", style: TextStyle(fontSize: 15),),
    };

    return CupertinoSlidingSegmentedControl(
      groupValue: groupValue,
      children: children,
      onValueChanged: (i) {
        setState(() {
          groupValue = int.parse("$i");
        });
        DDLog(groupValue);
      },
      // thumbColor: Colors.orangeAccent,
      backgroundColor: Colors.transparent,
    );
  }

}