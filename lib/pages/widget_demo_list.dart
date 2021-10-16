//
//  WidgetDemoList.dart
//  fluttertemplet
//
//  Created by shang on 10/15/21 3:00 PM.
//  Copyright © 10/15/21 shang. All rights reserved.
//


import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'WidgetListPage.dart';
import 'demoPage/SliverPersistentHeaderDemo.dart';
import 'package:fluttertemplet/dartExpand/string_extension.dart';


class WidgetDemoList extends StatefulWidget {

  final String? title;

  final bool hiddenAppBar;

  final List<String> sectionTitles;

  final List<List<Tuple2<String, String>>> sectionList;

  WidgetDemoList({
    Key? key,
    this.title,
    this.sectionTitles = const [],
    this.sectionList = const [],
    this.hiddenAppBar = false,
  }) :  assert(sectionList.length == sectionTitles.length),
        super(key: key);

  @override
  _WidgetDemoListState createState() => _WidgetDemoListState();
}

class _WidgetDemoListState extends State<WidgetDemoList> {

  List<Widget> slivers = [];

  @override
  void initState() {
    super.initState();

    _updateSlivers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: widget.hiddenAppBar ? null : AppBar(
          title: Text(widget.title ?? "$widget"),
        ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return
      CustomScrollView(
        slivers: slivers,

      );
  }

  Widget _buildHeader({required int section, required Widget child}) {
    return
    SliverToBoxAdapter(
      child: Container(
        color: Color(0xFFDDDDDD),
        padding: EdgeInsets.only(
          top: 10,
          bottom: 8,
          left: 15,
          right: 15
        ),
        child: child,
      ),
    );

    return
      SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: PersistentHeaderBuilder(builder: (ctx, offset) => Container(
            alignment: Alignment.center,
            color: Colors.orangeAccent,
            // child: Text("shrinkOffset:${offset.toStringAsFixed(1)}",
            child: child,
          ),
            max: 80,
          )
      );
  }

  Widget _buildSliverList({required int section, required List<Tuple2<String, String>> list}) {
    final items = widget.sectionList[section];

    return
        SliverList(
          delegate: SliverChildBuilderDelegate((_, int index)
          => _buildSliverItem(section: section, index: index, e: items[index]),
              childCount: items.length),
        );
  }

  Widget _buildSliverItem({required int section, required int index, required Tuple2<String, String> e}) {
    return ListTile(
      title: Text(e.item2),
      subtitle: Text(e.item2.toCapitalize()),
      trailing: Icon(Icons.keyboard_arrow_right_rounded),
      dense: true,
      onTap: (){
        // Get.toNamed(e.item1, arguments: e);
        if (e.item1.toLowerCase().contains("loginPage".toLowerCase())){
          Get.offNamed(e.item1, arguments: e.item1);
        } else {
          Get.toNamed(e.item1, arguments: e.item1);
        }
      },
    );
  }

  _updateSlivers() {
    for(int i = 0; i < widget.sectionTitles.length; i++) {
      final title = widget.sectionTitles[i];
      final items = widget.sectionList[i];
      items.sort((a, b) => a.item1.toLowerCase().compareTo(b.item1.toLowerCase()));
      slivers.add(_buildHeader(section: i,
        child: Text(title, style: TextStyle(fontSize: 16),),
      ));
      slivers.add(_buildSliverList(section: i, list: items));
    }
    ddlog([widget.sectionTitles.length, slivers.length]);

    setState(() {

    });
  }
}



///抽象封装
class SectionListView<T> extends StatefulWidget {

  final String? title;

  final bool hiddenAppBar;

  final List<String> headerTitles;

  final List<List<T>> itemList;

  final Widget Function(String title) headerBuilder;

  final Widget Function(int section, int row, T e) itemBuilder;

  SectionListView({
    Key? key,
    this.title,
    this.headerTitles = const [],
    this.itemList = const [],
    this.hiddenAppBar = false,
    required this.headerBuilder,
    required this.itemBuilder,
  }) :  assert(itemList.length == headerTitles.length),
        super(key: key);

  @override
  _SectionListViewState createState() => _SectionListViewState();
}

class _SectionListViewState<T extends Object> extends State<SectionListView> {

  List<Widget> slivers = [];

  @override
  void initState() {
    super.initState();

    _updateSlivers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: widget.hiddenAppBar ? null : AppBar(
        title: Text(widget.title ?? "$widget"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: slivers,
    );
  }

  Widget _buildHeader({required int section, required Widget child}) {
    return
      SliverToBoxAdapter(
        child: Container(
          color: Color(0xFFDDDDDD),
          padding: EdgeInsets.only(
              top: 10,
              bottom: 8,
              left: 15,
              right: 15
          ),
          child: child,
        ),
      );
  }

  Widget _buildSliverList({required int section, required List<T> list}) {
    final items = widget.itemList[section];
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, int index)
        => widget.itemBuilder(section, index, items[index]),
            childCount: items.length),
      );
  }

  _updateSlivers() {
    for(int i = 0; i < widget.headerTitles.length; i++) {
      final title = widget.headerTitles[i];
      var items = widget.itemList[i];
      slivers.add(_buildHeader(section: i, child: widget.headerBuilder(title),
      ));
      slivers.add(_buildSliverList(section: i, list: items.whereType<T>().toList()));
    }
    // ddlog([widget.sectionTitles.length, slivers.length]);

    setState(() {

    });
  }
}
