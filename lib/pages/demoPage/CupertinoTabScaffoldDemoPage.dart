import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:fluttertemplet/DartExpand/Widget_extension.dart';

class CupertinoTabScaffoldDemoPage extends StatefulWidget {

  @override
  _CupertinoTabScaffoldDemoPageState createState() => _CupertinoTabScaffoldDemoPageState();
}

class _CupertinoTabScaffoldDemoPageState extends State {
  @override
  Widget build(BuildContext context) {
//最外层导航选项卡
    return CupertinoTabScaffold(//底部选项卡
      tabBar: CupertinoTabBar(
        activeColor: Color(0xffff0000),
        backgroundColor: CupertinoColors.lightBackgroundGray, //选项卡背景色 items: [
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 24),
              label: '首⻚',
            ),

            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart, size: 24),
              label: '第二⻚',
            ),

            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble, size: 24),
              label: '第三页',
            ),
          ],
    ),
    tabBuilder: (context, index) {//选项卡绑定的视图
      return CupertinoTabView(
        builder: (context) {
          switch (index) {
            case 0:
              return OnePage();
              break;
            case 1:
              return TwoPage();
              break;
            default:
              return ThreePage();
              break;
          }
        });
      },
    );
  }
}


class OnePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return CupertinoPageScaffold(
    backgroundColor: Colors.red,
    navigationBar: CupertinoNavigationBar(
      middle: Text("主⻚"), ),
    child: Center(
      child: Text(
        'This is 主⻚ layout',
        style: Theme.of(context).textTheme.button,
      ),
    ), );
} }

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.lightBlue,
      navigationBar: CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.add),
        middle: Text("聊天面板"),

      ),
      child: Center(
        child: Text(
          'This is 聊天面板 layout',
          style: Theme.of(context).textTheme.button,
        ), ),
    ); }
}


class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.lightGreen,
      navigationBar: CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.add),
        middle: Text("聊天面板"),

      ),
      child: Center(
        child: Text(
          'This is 聊天面板 layout',
          style: Theme.of(context).textTheme.button,
        ), ),
    ); }
}