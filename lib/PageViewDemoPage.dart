import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:fluttertemplet/FirstPage.dart';
import 'package:fluttertemplet/SecondPage.dart';
import 'package:fluttertemplet/ThirdPage.dart';
import 'package:styled_widget/styled_widget.dart';

import 'DartExpand/ActionSheet_extension.dart';
import 'DartExpand/Widget_extension.dart';


class PageViewDemoPage extends StatefulWidget {

  @override
  _PageViewDemoPageState createState() => _PageViewDemoPageState();
}

class _PageViewDemoPageState extends State<PageViewDemoPage> {

  var titles = ["PageViewTabBarWidget", "2", "3"];

  final title = "新版本 v${2.1}";
  final message = """
1、支持立体声蓝牙耳机，同时改善配对性能;
2、提供屏幕虚拟键盘;
3、更简洁更流畅，使用起来更快;
4、修复一些软件在使用时自动退出bug;
""";

  final rightTitles = ["默认"];

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
          title: Text(arguments[1]),
            actions: rightTitles.map((e) => TextButton(onPressed: (){
              // DDLog("e");
              _actionTap(context: context, value: e);

            }, child: Text(e,
              style: TextStyle(color: Colors.white),)
            )).toList(),

        ),
        body: buildPageView(context)
            .padding(all: 10)
      ,
    );
  }

  Widget buildPageView(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      onPageChanged: (index){
        print('当前为第$index页');
      },
      children: <Widget>[
        Container(
          child: Text('第0页')
              .center()
          ,
        )
            .decorated(color: Colors.red)
        ,
        Container(
          child: Text('第1页')
              .center()
          ,
        )
            .decorated(color: Colors.lightGreen)
        ,
        Container(
          child: Text('第2页')
              .center()
          ,
        )
            .decorated(color: Colors.lightBlue)
        ,
      ],
    );
  }

  void _actionTap({required BuildContext context, required String value}) {
    switch(value){
      case "自定义":
        {

        }
        break;
      default:
        {

          CupertinoActionSheet(
            title: Text(title),
            message: Text(message),
            actions: titles.map((e) => CupertinoActionSheetAction(
              child: Text(e),
              onPressed: () {
                DDLog(e);
                Navigator.pop(context);
                Navigator.pushNamed(context, "/PageViewTabBarWidget", arguments: value);
              },
            ),).toList(),
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
              .toShowCupertinoModalPopup(context: context)
          ;
        }
        break;
    }
  }

}

/*--------------------------------------------------------------------------------------------------*/

class PageViewTabBarWidget extends StatefulWidget {

  //定义三个页面
  final pageWidgetList = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  final barItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mail),
      label: '邮件',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: '我的',
    ),
  ];

  var index = 0;
  var title = "PageViewTabBarWidget";
  var isAnimateToPage = false;
  // PageViewTabBarWidget({this.title, this.barItems, required this.pageWidgetList, this.index, this.isAnimateToPage});

  @override
  _PageViewTabBarWidgetState createState() => _PageViewTabBarWidgetState();
}

class _PageViewTabBarWidgetState extends State<PageViewTabBarWidget> {
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: buildPageView(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: widget.barItems,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.index,
      selectedFontSize: 14,
      selectedItemColor: Colors.blue,
      selectedIconTheme: IconThemeData(color: Colors.blue, size: 28),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedFontSize: 12,
      unselectedItemColor: Colors.black,
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      elevation: 10,
      onTap: (index) {
        DDLog('onTap: $index');
        widget.index = index;
        setState(() {
          if (widget.isAnimateToPage) {
            _pageController.animateToPage(widget.index, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          } else {
            _pageController.jumpToPage(widget.index);
          }
        });
      },
    );
  }

  PageView buildPageView(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: widget.pageWidgetList,
      controller: _pageController,
      onPageChanged: (index) {
        DDLog('onPageChanged: $index');
        widget.index = index;
        setState(() {});
      },
      pageSnapping: true,
      physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
    );
  }
}

