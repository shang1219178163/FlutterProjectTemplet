import 'package:flutter/material.dart';
import 'package:fluttertemplet/basicWidget/PageControllerWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';

import 'package:fluttertemplet/basicWidget/TableCellWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';

import 'package:fluttertemplet/mockData/mock_data.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';
import 'package:get/get.dart';

class WidgetListPage extends StatefulWidget {

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: pages.length, vsync: this);
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
}


var list = [
    [APPRouter.iconsListPage, "flutter 系统 Icons", ],
    [APPRouter.alertDialogDemoPage, "AlertDialog", ],
    [APPRouter.alertDialogDemoPage, "alertDialogDemoPage"],
    [APPRouter.alertSheetDemoPage, "AlertSheet", ],
    [APPRouter.gridViewDemoPage, "GridView", ],
    [APPRouter.pageViewDemoPage, "PageView", ],
    [APPRouter.snackBarDemoPage, "SnackBar", ],
    [APPRouter.cupertinoTabScaffoldDemo, "CupertinoTabScaffoldDemoPage", ],
    [APPRouter.pickerDemoPage, "pickerDemoPage", ],
    [APPRouter.datePickerPage, "DatePickerPage", ],
    [APPRouter.localNotifationDemoPage, "localNotifationDemoPage", ],
    [APPRouter.progressHudDemoPage, "progressHudDemoPage", ],
    [APPRouter.textFieldDemoPage, "textFieldDemoPage", ],
    [APPRouter.slidableDemoPage, "flutterSlidableDemoPage", ],
    [APPRouter.textFieldDemoPage, "textFieldDemoPage", ],
    [APPRouter.slidableDemoPage, "flutterSlidableDemoPage", ],
];

List<PageWidgetModel> pages = [
  // PageWidgetModel(title: '产品列表', widget: NNListWidget(list: kAliPayList,)),
  PageWidgetModel(title: '升级列表', widget: NNListUpdateAppWidget(list: kUpdateAppList,)),
  PageWidgetModel(title: '升级列表New', widget: NNListUpdateAppNewWidget(list: kUpdateAppList,)),

  PageWidgetModel(title: '功能列表', widget: ListView.separated(
    itemCount: list.length,
    itemBuilder: (context, index) {
      final array = list[index];
      return ListTile(
        title: Text(array[1]),
        subtitle: Text(array[0]),
        onTap: (){
          // DDLog(array);
          Get.toNamed(array[0], arguments: array);
          // Get.toNamed(array[0], arguments: array);
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

