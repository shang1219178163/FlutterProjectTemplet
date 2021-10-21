//
//  WidgetListPageDart.dart
//  fluttertemplet
//
//  Created by shang on 10/16/21 12:31 PM.
//  Copyright © 10/16/21 shang. All rights reserved.
//


import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/color_extension.dart';
import 'package:fluttertemplet/dartExpand/list_extension.dart';
import 'package:fluttertemplet/dartExpand/string_extension.dart';
import 'package:fluttertemplet/main.dart';
import 'package:fluttertemplet/basicWidget/PageControllerWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/basicWidget/section_list_view.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';

import 'package:fluttertemplet/basicWidget/TableCellWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';

import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'package:fluttertemplet/dartExpand/widget_extension.dart';

import 'demoPage/SliverPersistentHeaderDemo.dart';

class WidgetListPage extends StatefulWidget {

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: pages.length, vsync: this);

  @override
  void initState() {
    super.initState();
    this.tabController.index = pages.length - 1;

    testData();
  }

  @override
  void dispose() {
    this.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件列表'),
        bottom: TabBar(
          controller: this.tabController,
          isScrollable: true,
          tabs: pages.map((item) => Tab(text: item.title)).toList(),
        ),
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
      ),
      body: TabBarView(
        controller: this.tabController,
        children: pages.map((item) => item.widget).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {
          ddlog(["a", 18, null, true, ["1", "2", "3"], {"a": "aa", "b": "bb"}]);
          ddlog(_list);
          // final items = _list.map((e) => e.item1.compareTo(e.item2)).toList();
          final items = _list.sorted((a, b) => a.item1.toLowerCase().compareTo(b.item2.toLowerCase()));
          ddlog(items);

        },
      ),
    );
  }

  List<PageWidgetModel> pages = [
    // PageWidgetModel(title: '产品列表', widget: NNListWidget(list: kAliPayList,)),
    // PageWidgetModel(title: '升级列表', widget: NNListUpdateAppWidget(list: kUpdateAppList,)),
    // PageWidgetModel(title: '升级列表(新)', widget: NNListUpdateAppNewWidget(list: kUpdateAppList,)),

    PageWidgetModel(title: '列表(泛型)', widget: SectionListView<String, Tuple2<String, String>>(
      headerList: ["特殊功能", "动画相关", "系统组件demo", "自定义组件", "其它"],
      itemList: [_specials, _animateds, _list, _customeWidgets, _others]
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
            Get.toNamed(e.item1, arguments: e);
            if (e.item1.toLowerCase().contains("loginPage".toLowerCase())){
              Get.offNamed(e.item1, arguments: e.item1);
            } else {
              Get.toNamed(e.item1, arguments: e.item1);
            }
          },
        );
      },
    ),),


    // PageWidgetModel(title: '功能列表', widget: ListView.separated(
    //   itemCount: list.length,
    //   itemBuilder: (context, index) {
    //     list.sort((a, b) => a.item1.toLowerCase().compareTo(b.item1.toLowerCase()));
    //     final e = list[index];
    //
    //     return ListTile(
    //       title: Text(e.item2),
    //       subtitle: Text(e.item2.toCapitalize()),
    //       trailing: Icon(Icons.keyboard_arrow_right_rounded),
    //       dense: true,
    //       onTap: (){
    //         // Get.toNamed(e.item1, arguments: e);
    //         if (e.item1.toLowerCase().contains("loginPage".toLowerCase())){
    //           Get.offNamed(e.item1, arguments: e.item1);
    //         } else {
    //           Get.toNamed(e.item1, arguments: e.item1);
    //         }
    //       },
    //     );
    //   },
    //   separatorBuilder: (context, index) {
    //     return Divider(
    //       height: .5,
    //       indent: 15,
    //       endIndent: 15,
    //       color: Color(0xFFDDDDDD),
    //     );
    //   },
    // ),
    // ),
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
  Tuple2(APPRouter.slidableDemoPage, "SlidableDemoPage", ),
  Tuple2(APPRouter.sliverAppBarDemoPage, "SliverAppBarDemoPage", ),
  Tuple2(APPRouter.sliverFamilyDemo, "SliverFamilyDemo", ),
  Tuple2(APPRouter.sliverFamilyPageViewDemo, "sliverFamilyPageViewDemo", ),
  Tuple2(APPRouter.sliverPersistentHeaderDemo, "sliverPersistentHeaderDemo", ),

  Tuple2(APPRouter.tabBarDemoPage, "tabBarDemoPage", ),
  Tuple2(APPRouter.tableViewDemoPage, "tableViewDemoPage", ),
  Tuple2(APPRouter.textlessDemo, "textlessDemo", ),
  Tuple2(APPRouter.textFieldDemo, "textFieldDemo", ),

  Tuple2(APPRouter.layoutBuilderDemo, "layoutBuilderDemo", ),
  Tuple2(APPRouter.tableDemo, "tableDemo", ),
  Tuple2(APPRouter.nestedScrollViewDemo, "nestedScrollViewDemo", ),

  Tuple2(APPRouter.popoverDemo, "popoverDemo", ),
  
];

var _specials = [
  Tuple2(APPRouter.iconsListPage, "flutter 系统 Icons", ),
  Tuple2(APPRouter.providerRoute, "providerRoute", ),
  Tuple2(APPRouter.providerListDemo, "providerListDemo", ),

  // Tuple2(APPRouter.widgetDemoList, "widgetDemoList", ),
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
  Tuple2(APPRouter.githubRepoDemo, "githubRepoDemo", ),


];

