import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/main.dart';


///多页面左右滚动容器模型
class PageWidgetModel {
  final String title;
  final Widget widget;

  const PageWidgetModel({
    required this.title,
    required this.widget,
  });
}

///多页面左右滚动容器
class PageControllerWidget extends StatelessWidget {
  final String title;
  final List<PageWidgetModel> pages;
  final bool tabScrollable;
  final TabController tabController;

  const PageControllerWidget({Key? key,
    required this.title,
    required this.pages,
    required this.tabController,
    required this.tabScrollable,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        bottom: TabBar(
          controller: this.tabController,
          isScrollable: this.tabScrollable,
          tabs: this.pages.map((item) => Tab(text: item.title)).toList(),
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
            // Get.toNamed(e.item1, arguments: e);
          }, child: Text("状态管理", style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: TabBarView(
        controller: this.tabController,
        children: this.pages.map((item) => item.widget).toList(),
      ),
    );
  }
}
