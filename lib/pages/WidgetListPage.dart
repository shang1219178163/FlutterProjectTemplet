import 'package:flutter/material.dart';
import 'package:fluttertemplet/basicWidget/PageControllerWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';

import 'package:fluttertemplet/basicWidget/TableCellWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';

import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'package:fluttertemplet/dartExpand/widget_extension.dart';

class WidgetListPage extends StatefulWidget {

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: pages.length, vsync: this);

  @override
  void initState() {
    super.initState();

    testData();
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.tabController.index = pages.length - 1;

    return PageControllerWidget(
      title: '基础组件列表',
      pages: pages,
      tabController: this.tabController,
      tabScrollable: true,
    );
  }

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

    // array.or(() => null)

    final List<String>? array1 = List.generate(9, (index) => "$index");
    final array11 = array1!.reduce((value, element) => value + element);
    ddlog(array11);

    ddlog(array.or(() => array1));

    // Iterable<T> map<T>(T f(E e)) => MappedIterable<E, T>(this, f);
  }
}

var list = [
  Tuple2(APPRouter.iconsListPage, "flutter 系统 Icons", ),
  Tuple2(APPRouter.tabBarDemoPage, "tabBarDemoPage", ),
  Tuple2(APPRouter.pageViewDemo, "PageViewDemo", ),
  Tuple2(APPRouter.animatedDemoPage, "AnimatedDemoPage", ),

  Tuple2(APPRouter.alertDialogDemoPage, "AlertDialog", ),
  Tuple2(APPRouter.alertSheetDemoPage, "AlertSheet", ),
  Tuple2(APPRouter.reorderableListViewDemoPage, "reorderableListViewDemoPage", ),
  Tuple2(APPRouter.gridViewDemoPage, "GridView", ),

  Tuple2(APPRouter.snackBarDemoPage, "SnackBar", ),
  Tuple2(APPRouter.cupertinoTabScaffoldDemo, "CupertinoTabScaffoldDemoPage", ),
  Tuple2(APPRouter.pickerDemoPage, "pickerDemoPage", ),
  Tuple2(APPRouter.datePickerPage, "DatePickerPage", ),
  Tuple2(APPRouter.ExpandIconDemoNew, "ExpandIconDemoNew", ),
  Tuple2(APPRouter.expandIconDemo, "expandIconDemo", ),

  Tuple2(APPRouter.stepperDemoPage, "stepperDemoPage", ),
  Tuple2(APPRouter.numberStepperDemoPage, "NumberStepperDemoPage", ),

  Tuple2(APPRouter.localNotifationDemoPage, "localNotifationDemoPage", ),
  Tuple2(APPRouter.progressHudDemo, "ProgressHudDemo", ),
  Tuple2(APPRouter.progressHudDemoNew, "ProgressHudDemoNew", ),
  Tuple2(APPRouter.textFieldDemoPage, "textFieldDemoPage", ),
  Tuple2(APPRouter.slidableDemoPage, "SlidableDemoPage", ),
  Tuple2(APPRouter.draggableDemoPage, "draggableDemoPage", ),
  Tuple2(APPRouter.animatedIconDemoPage, "AnimatedIconDemoPage", ),

  Tuple2(APPRouter.loginPage, "LoginPage", ),
  Tuple2(APPRouter.loginPage2, "LoginPage2", ),
  Tuple2(APPRouter.dateTableDemoPage, "dateTableDemoPage", ),
  Tuple2(APPRouter.segmentControlDemoPage, "segmentControlDemoPage", ),

  Tuple2(APPRouter.rangerSliderDemoPage, "rangerSliderDemoPage", ),
  Tuple2(APPRouter.draggableScrollableSheetDemoPage, "draggableScrollableSheetDemoPage", ),
  Tuple2(APPRouter.progressIndicatorDemoPage, "ProgressIndicatorDemoPage", ),
  Tuple2(APPRouter.appWebViewDemoPage, "appWebViewDemoPage", ),
  Tuple2(APPRouter.enlargeStrategyDemo, "enlargeStrategyDemo", ),

  Tuple2(APPRouter.sliverAppBarDemoPage, "SliverAppBarDemoPage", ),
  Tuple2(APPRouter.hudProgressDemo, "HudProgressDemo", ),
  Tuple2(APPRouter.pageViewTabBarWidget, " PageViewTabBarWidget", ),

  Tuple2(APPRouter.tabBarDemoPage, "tabBarDemoPage", ),
  Tuple2(APPRouter.tableViewDemoPage, "tableViewDemoPage", ),

  Tuple2(APPRouter.githubRepoDemo, "githubRepoDemo", ),

  Tuple2(APPRouter.locationPopView, "locationPopView", ),

  Tuple2(APPRouter.backdropFilterDemo, "backdropFilterDemo", ),
  Tuple2(APPRouter.textlessDemo, "textlessDemo", ),

  Tuple2(APPRouter.richTextDemo, "richTextDemo", ),
  Tuple2(APPRouter.dateTimeDemo, "dateTimeDemo", ),
  Tuple2(APPRouter.numberFormatDemo, "numberFormatDemo", ),

];


List<PageWidgetModel> pages = [
  // PageWidgetModel(title: '产品列表', widget: NNListWidget(list: kAliPayList,)),
  PageWidgetModel(title: '升级列表', widget: NNListUpdateAppWidget(list: kUpdateAppList,)),
  PageWidgetModel(title: '升级列表(新)', widget: NNListUpdateAppNewWidget(list: kUpdateAppList,)),

  PageWidgetModel(title: '功能列表', widget: ListView.separated(
    itemCount: list.length,
    itemBuilder: (context, index) {
      // final e = list[index];
      list.sort((a, b) => a.item1.compareTo(b.item1));
      final e = list[index];

      return ListTile(
        title: Text(e.item2),
        subtitle: Text(e.item2),
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
    separatorBuilder: (context, index) {
      return Divider(
        height: .5,
        indent: 15,
        endIndent: 15,
        color: Color(0xFFDDDDDD),
      );
    },
  ),
  ),

];

