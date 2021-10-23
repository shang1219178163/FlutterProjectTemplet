//
//  TabBarPageView.dart
//  fluttertemplet
//
//  Created by shang on 10/22/21 5:03 PM.
//  Copyright © 10/22/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:tuple/tuple.dart';

/// TabBar + PageViewW
class TabBarPageView extends StatefulWidget {

  final List<Tuple2<String, Widget>> items;

  final Color? indicatorColor;

  final Color? labelColor;

  final PageController? pageController;

  final TabController? tabController;

  final ValueChanged<int> onPageChanged;

  final bool Function(int)? canPageChanged;

  final bool isTabBarTop;

  TabBarPageView({
    Key? key,
    this.isTabBarTop = true,
    required this.items,
    this.indicatorColor,
    this.labelColor,
    this.pageController,
    this.tabController,
    required this.onPageChanged,
    this.canPageChanged,
  }) : super(key: key);

  @override
  _TabBarPageViewState createState() => _TabBarPageViewState();
}

class _TabBarPageViewState extends State<TabBarPageView> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  late PageController _pageController;

  ///是否允许滚动
  bool get canScrollable {
    if (widget.canPageChanged != null && widget.canPageChanged!(_tabController.index) == false) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    _tabController = widget.tabController ?? TabController(length: widget.items.length, vsync: this);
    _pageController = widget.pageController ?? PageController(initialPage: 0, keepPage: true);
    // ..addListener(() {
    //   ddlog(_pageController.page);
    //
    // });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = [
      _buildTabBar(),
      _buildPageView(),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.isTabBarTop ? list : list.reversed.toList(),
    );
  }

  Widget _buildTabBar() {
    final textColor = widget.labelColor ?? Theme
        .of(context)
        .colorScheme
        .secondary;
    final bgColor = widget.indicatorColor ?? Colors.white;

    // final bgColor = Theme.of(context).colorScheme.secondary;
    // final textColor = Colors.white;

    BoxDecoration indicatorTop = BoxDecoration(
      border: Border(
        top: BorderSide(
          // color: textColor ,
            color: textColor,
            width: 3.0
        ),
      ),
    );

    BoxDecoration indicatorBom = BoxDecoration(
      border: Border(
        bottom: BorderSide(
          // color: textColor ,
            color: textColor,
            width: 3.0
        ),
      ),
    );


    final tabBar = TabBar(
      controller: _tabController,
      tabs: widget.items.map((e) => Tab(text: e.item1)).toList(),
      labelColor: textColor,
      indicator: widget.isTabBarTop ? indicatorBom : indicatorTop,
      onTap: (index) {
        // ddlog(index);
        setState(() {
          _pageController.jumpToPage(index);
        });
      },
    );

    if (!canScrollable) {
      return IgnorePointer(
        child: tabBar,
      );
    }

    if (widget.isTabBarTop) {
      return tabBar;
    }

    return Material(
        color: bgColor,
        child: SafeArea(
          child: tabBar,
        )
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        physics: canScrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
        children: widget.items.map((e) => e.item2).toList(),
        onPageChanged: (index) {
          widget.onPageChanged(index);
          setState(() {
            _tabController.animateTo(index);
          });
        },
      ));
  }
}