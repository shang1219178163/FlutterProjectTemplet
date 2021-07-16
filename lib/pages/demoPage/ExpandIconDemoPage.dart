//
//	ExpandIconDemoPage.dart
//	MacTemplet
//
//	Created by Bin Shang on 2021/06/11 16:13
//	Copyright © 2021 Bin Shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';


class ExpandIconDemoPage extends StatefulWidget {
  ExpandIconDemoPageState createState() => ExpandIconDemoPageState();
}

class ExpandIconDemoPageState extends State<ExpandIconDemoPage> {

  late bool _isExpanded = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$widget"),
      ),
      // body: buildExpandIcon(context),
      // body: buildExpansionPanelList(context),
      body: Column(
        children: [
          buildExpandIcon(context),
          buildExpansionPanelList(context),
        ],
      ),

    );
  }

  Widget buildExpandIcon(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.green,
          child: Row(
            children: <Widget>[
              SizedBox(width: 25),
              Expanded(
                child: Text(
                    'ExpandIcon Row',
                    style: TextStyle(color: Colors.white, fontSize: 22)
                ),
              ),
              ExpandIcon(
                isExpanded: _isExpanded,
                color: Colors.white,
                expandedColor: Colors.black,
                disabledColor: Colors.grey,
                onPressed: (bool isExpanded) {
                  setState(() {
                    _isExpanded = !isExpanded;
                    ddlog(isExpanded);
                  });
                },
              ),
              SizedBox(width: 25),
            ],
          ),
        ),
        Visibility(
          visible: _isExpanded,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text('我被 ExpandIcon 控制显示状态',
              style: TextStyle(
                color: Colors.black,
                // decorationColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }


  final List<Item> _data = generateItems(3);

  Widget buildExpansionPanelList(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      dividerColor: Colors.red,
      // elevation: 4,
      expandedHeaderPadding: EdgeInsets.only(top: 0, bottom: 0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
              subtitle: Text("subtitle"),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}