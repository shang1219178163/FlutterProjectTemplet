//
//  TabBarTabBarViewDemo.dart
//  fluttertemplet
//
//  Created by shang on 10/22/21 2:32 PM.
//  Copyright © 10/22/21 shang. All rights reserved.
//

import 'package:enhance_expansion_panel/enhance_expansion_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertemplet/basicWidget/list_subtitle_cell.dart';
import 'package:fluttertemplet/dartExpand/color_extension.dart';
import 'package:fluttertemplet/dartExpand/divider_extension.dart';
import 'package:fluttertemplet/dartExpand/list_extension.dart';
import 'package:fluttertemplet/dartExpand/string_extension.dart';
import 'package:fluttertemplet/main.dart';
import 'package:fluttertemplet/basicWidget/app_update_card.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/basicWidget/section_list_view.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';

import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'package:fluttertemplet/dartExpand/widget_extension.dart';

import '../basicWidget/enhance_expand_list_view.dart';

class TabBarTabBarViewDemo extends StatefulWidget {

  @override
  _TabBarTabBarViewDemoState createState() => _TabBarTabBarViewDemoState();
}

class _TabBarTabBarViewDemoState extends State<TabBarTabBarViewDemo> with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: _pages.length, vsync: this);

  // late PageController _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    _tabController.index = _pages.length - 1;

    testData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件列表'),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              // Scaffold.of(context).openDrawer();
              kScaffoldKey.currentState!.openDrawer();
            },
          );
        }),
        actions: [
          TextButton(onPressed: (){
            ddlog("provider");
            Get.toNamed(APPRouter.providerListDemo, arguments: "状态管理");
          }, child: Text("状态管理", style: TextStyle(color: Colors.white),),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _pages.map((e) => Tab(text: e.item1)).toList(),
          // indicatorSize: TabBarIndicatorSize.label,
          // indicatorPadding: EdgeInsets.only(left: 6, right: 6),
        ),
        //自定义导航栏
        // bottom: PreferredSize(
        //     child: Theme(
        //       data: Theme.of(context).copyWith(accentColor: Colors.white),
        //       child: Container(
        //         height: 40,
        //         alignment: Alignment.center, //圆点居中
        //         //给自定义导航栏设置圆点控制器
        //         child: TabPageSelector(
        //           color: Colors.grey,
        //           selectedColor: Colors.white,
        //           controller: _tabController,
        //         ),
        //       ),
        //     ),
        //     preferredSize: Size.fromHeight(48)),

      ),
      body: TabBarView(
        controller: _tabController,
        children: _pages.map((e) => e.item2).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {
          // ddlog(["a", 18, null, true, ["1", "2", "3"], {"a": "aa", "b": "bb"}]);
          // ddlog(_list);
        },
      ),
    );
  }

  List<Tuple2<String, Widget>> _pages = [
    Tuple2('功能列表', ListView.separated(
      cacheExtent: 180,
      itemCount: kAliPayList.length,
      itemBuilder: (context, index) {
        final data = kAliPayList[index];
        return ListSubtitleCell(
          padding: EdgeInsets.all(10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              data.imageUrl,
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            data.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          subtitle: Text(data.content,
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF999999),
            ),
          ),
          trailing: Text(data.time,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF999999),
            ),
          ),
          subtrailing: Text("已完成",
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return DividerExt.custome();
      },
    )),

    Tuple2('升级列表', ListView.separated(
      cacheExtent: 180,
      itemCount: kUpdateAppList.length,
      itemBuilder: (context, index) {
        final data = kUpdateAppList[index];
        if (index == 0) {
          return AppUpdateCard(data: data, isExpand: true, showExpand: false,);
        }
        return AppUpdateCard(data: data);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    )),

    Tuple2('列表(泛型)', SectionListView<String, Tuple2<String, String>>(
      headerList: _tuples.map((e) => e.item1).toList(),
      itemList: _tuples.map((e) => e.item2).toList()
          .map((e) => e.sorted((a, b) => a.item1.toLowerCase().compareTo(b.item1.toLowerCase()))).toList(),
      headerBuilder: (e) {
        return Text(e, style: TextStyle(fontWeight: FontWeight.w600),);
      },
      itemBuilder: (section, row, e) {
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
      },
    ),),

    Tuple2('列表(折叠)', EnhanceExpandListView(
      children: _tuples.map<ExpandPanelModel<Tuple2<String, String>>>((e) => ExpandPanelModel(
      canTapOnHeader: true,
      isExpanded: false,
      arrowPosition: EnhanceExpansionPanelArrowPosition.none,
      // backgroundColor: Color(0xFFDDDDDD),
      headerBuilder: (contenx, isExpand) {
        return Container(
          // color: Colors.green,
          color: isExpand ? Colors.black12 : null,
          child: ListTile(
            title: Text("${e.item1}", style: TextStyle(fontWeight: FontWeight.bold),),
            // subtitle: Text("subtitle"),
          ),
        );
      },
      bodyChildren: e.item2,
      bodyItemBuilder: (context, e) {
        return ListTile(
          title: Text(e.item1, style: TextStyle(fontSize: 14),),
          subtitle: Text(e.item2, style: TextStyle(fontSize: 12),),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            ddlog("section_");
            if (e.item1.toLowerCase().contains("loginPage".toLowerCase())){
              Get.offNamed(e.item1, arguments: e.item1);
            } else {
              Get.toNamed(e.item1, arguments: e.item1);
            }
          });
      },
    )).toList(),)),

  ];

  void testData() {
    final String? a = null;
    ddlog(a.runtimeType);

    final String? a1 = "a1";
    ddlog(a1.runtimeType);

    final List<String>? array = null;
    ddlog(array.runtimeType);

    ddlog(a.isBlank);
    // ddlog(a.or(block: (){
    //   return "123";
    // }));
    ddlog(a.or(() => "456"));
    ddlog(a.or((){
      return "111";
    }));

    // array.or(() => null);

    final List<String>? array1 = List.generate(9, (index) => "$index");
    final result = array1!.reduce((value, element) => value + element);
    ddlog(result);

    ddlog(array.or(() => array1));

    final nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    final val = nums.reduce((value, element) => value + element);
    ddlog(val);

    final map = {"a": "aa", "b": "bb", "c": "cc",} ;
    final value = map["d"] ?? "-";
    ddlog(value);
  }
}

final _tuples = [
  Tuple2("特殊功能", _specials),
  Tuple2("动画相关", _animateds),
  Tuple2("系统组件demo", _list),
  Tuple2("自定义组件", _customeWidgets),
  Tuple2("其它", _others)];

var _list = [
  Tuple2(APPRouter.alertDialogDemoPage, "AlertDialog", ),
  Tuple2(APPRouter.alertSheetDemoPage, "AlertSheet", ),
  Tuple2(APPRouter.appWebViewDemoPage, "appWebViewDemoPage", ),

  Tuple2(APPRouter.backdropFilterDemo, "backdropFilterDemo", ),

  Tuple2(APPRouter.cupertinoTabScaffoldDemo, "CupertinoTabScaffoldDemoPage", ),
  Tuple2(APPRouter.cupertinoFormDemo, "cupertinoFormDemo", ),
  Tuple2(APPRouter.contextMenuActionDemo, "cupertinoFormDemo", ),

  Tuple2(APPRouter.dateTableDemoPage, "dateTableDemoPage", ),
  Tuple2(APPRouter.draggableDemoPage, "draggableDemoPage", ),
  Tuple2(APPRouter.draggableScrollableSheetDemoPage, "draggableScrollableSheetDemoPage", ),

  Tuple2(APPRouter.enlargeStrategyDemo, "enlargeStrategyDemo", ),
  Tuple2(APPRouter.expandIconDemo, "expandIconDemo", ),
  Tuple2(APPRouter.expandIconDemoNew, "ExpandIconDemoNew", ),

  Tuple2(APPRouter.gridViewDemoPage, "GridView", ),
  Tuple2(APPRouter.gridPaperDemo, "gridPaperDemo", ),

  Tuple2(APPRouter.menuDemo, "MenuDemo", ),

  Tuple2(APPRouter.pageViewDemo, "PageViewDemo", ),
  Tuple2(APPRouter.pageViewTabBarWidget, "PageViewTabBarWidget", ),

  Tuple2(APPRouter.pickerDemoPage, "pickerDemoPage", ),
  Tuple2(APPRouter.progressHudDemo, "ProgressHudDemo", ),
  Tuple2(APPRouter.progressHudDemoNew, "ProgressHudDemoNew", ),
  Tuple2(APPRouter.progressIndicatorDemoPage, "ProgressIndicatorDemoPage", ),

  Tuple2(APPRouter.reorderableListViewDemoPage, "reorderableListViewDemoPage", ),
  Tuple2(APPRouter.recordListDemo, "textFieldDemoPage", ),
  Tuple2(APPRouter.rangerSliderDemoPage, "rangerSliderDemoPage", ),

  Tuple2(APPRouter.segmentControlDemoPage, "segmentControlDemoPage", ),
  Tuple2(APPRouter.snackBarDemoPage, "SnackBar", ),
  Tuple2(APPRouter.stepperDemoPage, "stepperDemoPage", ),
  Tuple2(APPRouter.slidableDemo, "SlidableDemo", ),
  Tuple2(APPRouter.sliverAppBarDemoPage, "SliverAppBarDemoPage", ),
  Tuple2(APPRouter.sliverFamilyDemo, "SliverFamilyDemo", ),
  Tuple2(APPRouter.sliverFamilyPageViewDemo, "sliverFamilyPageViewDemo", ),
  Tuple2(APPRouter.sliverPersistentHeaderDemo, "sliverPersistentHeaderDemo", ),

  Tuple2(APPRouter.tabBarDemoPage, "tabBarDemoPage", ),
  Tuple2(APPRouter.textlessDemo, "textlessDemo", ),
  Tuple2(APPRouter.textFieldDemo, "textFieldDemo", ),

  Tuple2(APPRouter.layoutBuilderDemo, "layoutBuilderDemo", ),
  Tuple2(APPRouter.tableDemo, "tableDemo", ),
  Tuple2(APPRouter.nestedScrollViewDemo, "nestedScrollViewDemo", ),

  Tuple2(APPRouter.popoverDemo, "popoverDemo", ),
  Tuple2(APPRouter.absorbPointerDemo, "absorbPointerDemo", ),
  Tuple2(APPRouter.willPopScopeDemo, "willPopScopeDemo", ),

  Tuple2(APPRouter.futureBuilderDemo, "futureBuilderDemo", ),
  Tuple2(APPRouter.streamBuilderDemo, "streamBuilderDemo", ),
  Tuple2(APPRouter.bannerDemo, "bannerDemo", ),

  Tuple2(APPRouter.indexedStackDemo, "indexedStackDemo", ),

];

var _specials = [
  Tuple2(APPRouter.systemIconsPage, "flutter 系统 Icons", ),
  Tuple2(APPRouter.providerRoute, "providerRoute", ),
  Tuple2(APPRouter.providerListDemo, "providerListDemo", ),

  Tuple2(APPRouter.tabBarPageViewDemo, "tabBarPageViewDemo", ),
  Tuple2(APPRouter.tabBarReusePageDemo, "tabBarReusePageDemo", ),

  Tuple2(APPRouter.githubRepoDemo, "githubRepoDemo", ),

];

var _animateds = [
  // Tuple2(APPRouter.animatedIconDemoPage, "AnimatedIconDemoPage", ),
  Tuple2(APPRouter.animatedDemoPage, "AnimatedDemoPage", ),

  Tuple2(APPRouter.animatedSwitcherDemo, "animatedSwitcherDemo", ),
  Tuple2(APPRouter.animatedWidgetDemo, "animatedWidgetDemo", ),

];

var _customeWidgets = [
  Tuple2(APPRouter.datePickerPage, "DatePickerPage", ),
  Tuple2(APPRouter.dateTimeDemo, "dateTimeDemo", ),
  Tuple2(APPRouter.hudProgressDemo, "HudProgressDemo", ),
  Tuple2(APPRouter.localNotifationDemoPage, "localNotifationDemoPage", ),
  Tuple2(APPRouter.locationPopView, "locationPopView", ),
  Tuple2(APPRouter.numberStepperDemoPage, "NumberStepperDemoPage", ),
  Tuple2(APPRouter.numberFormatDemo, "numberFormatDemo", ),

];

var _others = [
  Tuple2(APPRouter.richTextDemo, "richTextDemo", ),
  Tuple2(APPRouter.loginPage, "LoginPage", ),
  Tuple2(APPRouter.loginPage2, "LoginPage2", ),

];
