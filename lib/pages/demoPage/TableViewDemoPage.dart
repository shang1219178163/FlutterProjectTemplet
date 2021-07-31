//
//  TableViewDemoPage.dart
//  fluttertemplet
//
//  Created by shang on 6/30/21 10:08 AM.
//  Copyright © 6/30/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';

class TableViewDemoPage extends StatefulWidget {

  final String? title;

  TableViewDemoPage({ Key? key, this.title}) : super(key: key);


  @override
  _TableViewDemoPageState createState() => _TableViewDemoPageState();
}

class _TableViewDemoPageState extends State<TableViewDemoPage> {

  late ScrollController _scrollController = ScrollController();

  List<String> _cities = List.generate(20, (index) => "$index").toList();

  /// 是否显示顶部的tag提示标签
  bool _showTopOffstage = true;
  /// 顶部tag标签的动态高度
  double _topOffstageTop = 0;
  /// 每一个顶部标签的高度
  late double topTagHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "$widget"),
        ),
        body: SafeArea(
          bottom: true,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Stack(children: _buildChildren(context))),
            ],
          ),
        ),
    );
  }

  /// 生成中间的字母提示Modal
  Widget _buildCenterModal() {
    return Center(
      child: Card(
        color: Colors.black54,
        child: Container(
          alignment: Alignment.center,
          width: 80.0,
          height: 80.0,
          child: Text(
            'X',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }


  List<Widget> _buildChildren(BuildContext context) {
//    print("_initTargetCity.code ${_initTargetCity}");
    List<Widget> children = [];
    ThemeData theme = Theme.of(context);
    children.add(ListView.builder(
        controller: _scrollController,
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          bool offstage = index == 0 ? false : true;

          return Column(
            children: <Widget>[
              Offstage(
                offstage: offstage,
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  color: Colors.red,
                  child: Text(
                    "$index",
                    softWrap: true,
                    // style: TextStyle(
                    //     fontSize: widget.topIndexFontSize,
                    //     color: widget.topIndexFontColor),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                // key: index == 0 ? _key0 : null,
                child: Center(
                  child: ListTileTheme(
                    selectedColor: theme.primaryColor,
                    textColor: theme.accentColor,
                    child: ListTile(
                      selected: false,
                      title: Text("$index",
                          style: TextStyle(fontSize: 17)),
                      onTap: () {
                        // Navigator.pop(context, _buildResult(_cities[index]));
                        ddlog("$index");
                      },


                    ),
                  ),
                ),
              )
            ],
          );
        }));
    if (_showTopOffstage) {
      children.add(Positioned(
        top: _topOffstageTop,
        left: 0,
        right: 0,
        child: Offstage(
          offstage: false,
          child: Container(
            height: topTagHeight,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15.0),
            color: Colors.red,
            child: Text(
              "_tagName ?? _tagList.first",
              softWrap: true,
              // style: TextStyle(
              //   fontSize: widget.topIndexFontSize,
              //   color: widget.topIndexFontColor,
              // ),
            ),
          ),
        ),
      ));
    }
    return children;
  }
}

class TableViewSectionWidget extends StatelessWidget {

  final String? title;

  const TableViewSectionWidget({
  	Key? key,
  	this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments[1]),
        ),
        body: Text(arguments.toString())
    );
  }
}
