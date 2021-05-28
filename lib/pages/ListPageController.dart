import 'package:flutter/material.dart';
import 'package:fluttertemplet/basicWidget/PageControllerWidget.dart';

import 'package:fluttertemplet/basicWidget/TableCellWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';

import 'package:fluttertemplet/NNListWidgetPage.dart';
import 'package:fluttertemplet/mockData/mock_data.dart';


class ListPageController extends StatefulWidget {

  @override
  _ListPageControllerState createState() => _ListPageControllerState();
}

class _ListPageControllerState extends State<ListPageController> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: pages.length, vsync: this);
    // this.tabController.index = 2;
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageControllerWidget(
      title: 'ListView组件',
      pages: pages,
      tabController: this.tabController,
      tabScrollable: true,
    );
  }
}


const List<PageWidgetModel> pages = [
  // PageWidgetModel(title: '普通用法', widget: NormalList()),
  // PageWidgetModel(title: 'builder用法', widget: SubscribeAccountList()),
  // PageWidgetModel(title: 'separated用法', widget:
  //   NNListWidget(list: infoList, itemBlock: (data) {
  //     return TableCellWidget(data: data);
  //   },
  // ),
  //   // NNListWidget(list: infoList, itemBuilder: (int index) {
  //   //   return TableCellWidget(data: infoList[index]);
  //   // })),
  PageWidgetModel(title: '产品列表', widget: NNListWidget(list: kAliPayList,)),
  PageWidgetModel(title: '升级列表', widget: NNListUpdateAppWidget(list: kUpdateAppList,)),
  PageWidgetModel(title: '升级列表New', widget: NNListUpdateAppNewWidget(list: kUpdateAppList,)),
  // PageWidgetModel(title: '升级列表N', widget: NNListUpdateAppCardWidget(list: kUpdateApp)),List,)),
  // PageWidgetModel(title: '升级列表5', widget: NNListUpdateAppCardWidget(list: kUpdateAppList,

  // PageWidgetModel(title: 'separated用法1', widget: NNListOneWidget(list: kAliPayList,)),

  // PageWidgetModel(title: '下拉刷新用法', widget: PullDownRefreshList()),
  // PageWidgetModel(title: '上拉加载用法', widget: PullUpLoadMoreList()),
];
