import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/BasicWidget/AppUpgradeWidget.dart';
import 'package:fluttertemplet/DartExpand/ActionSheet_extension.dart';
import 'package:fluttertemplet/FirstPage.dart';
import 'package:fluttertemplet/DartExpand/Navigator_extension.dart';
import 'package:fluttertemplet/FourthPage.dart';
import 'package:fluttertemplet/SecondPage.dart';
import 'package:fluttertemplet/ThirdPage.dart';
import 'package:fluttertemplet/TextlessPage.dart';

import 'package:styled_widget/styled_widget.dart';

import 'package:fluttertemplet/TabBarDemo.dart';
import 'package:fluttertemplet/ListPageController.dart';

import 'AlertDialogExamplePage.dart';
import 'AlertSheetExamplePage.dart';
import 'DartExpand/DDLog.dart';
import 'DartExpand/PopupMenuButton_extension.dart';
import 'DartExpand/AlertDialog_extension.dart';
import 'FButtonPage.dart';
import 'IconsListPage.dart';
import 'NNListWidgetPage.dart';
import 'WidgetListPage.dart';


var kRoutes = <String, WidgetBuilder>{
  "/MyHomePage": (context) => MyHomePage(),
  "/FirstPage": (context) => FirstPage(),
  "/SecondPage": (context) => SecondPage(),
  "/ThirdPage": (context) => ThirdPage(),
  "/FourthPage": (context) => FourthPage(),
  "/TabBarDemo": (context) => TabBarDemo(),
  "/WidgetListPage": (context) => WidgetListPage(),
  "/textlessPage": (context) => TextlessPage(),
  "/AlertDialogExamplePage": (context) => AlertDialogExamplePage(),
  "/AlertSheetExamplePage": (context) => AlertSheetExamplePage(),
  "/IconsListPage": (context) => IconsListPage(),

};


void main() {
  runApp(MyApp());
  // runApp(TabBarDemo());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your aptplication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Templet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,//设置明暗模式为暗色
        // accentColor: Colors.black,//(按钮）Widget前景色为黑色
        // primaryColor: Colors.lightBlue,//主色调为青色
        iconTheme:IconThemeData(color: Colors.yellow),//设置icon主题色为黄色
        // textTheme: TextTheme(body1: TextStyle(color: Colors.red))//设置文本颜色为红色
    ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/MyHomePage",
      routes: kRoutes,
    // routes: {
    //     "/": (context) => MyHomePage(),
    //     "/TwoPage": (context) => TwoPage(),
    //   },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final pages = [WidgetListPage(), SecondPage(), TabBarDemo(), ListPageController(), FirstPage()];

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      // backgroundColor: Colors.white,
      icon: Icon(Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      // backgroundColor: Colors.white,
      icon: Icon(Icons.merge_type_sharp),
      label: "按钮",
    ),
    BottomNavigationBarItem(
      // backgroundColor: Colors.white,
      icon: Icon(Icons.message),
      label: "消息",
    ),
    BottomNavigationBarItem(
      // backgroundColor: Colors.amber,
      icon: Icon(Icons.shopping_cart),
      label: "购物车",
    ),
    BottomNavigationBarItem(
      // backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      label: "个人中心",
    ),
  ];
  
  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  //lifecycle
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      // appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black54,

        selectedIconTheme: IconThemeData(color: Colors.lightBlue),
        unselectedIconTheme: IconThemeData(color: Colors.black54),

        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  ///创建导航栏
  AppBar buildAppBar(){
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(widget.title ?? "标题"),
      //导航条左边的组件
      leading: Icon(Icons.arrow_back)
          .opacity(0)
          .gestures(onTap: () => DDLog("back")),
      //导航条右边的一组组件
      actions: [
        // Icon(Icons.settings)
        //     .padding(right: 8)
        //     .gestures(onTap: ()=> DDLog("settings")),
        // Icon(Icons.search)
        //     // .padding(right: 8)
        //     .gestures(onTap: ()=> DDLog("search")),

        PopupMenuButtonExt.fromEntryFromJson(
            json: {"aa": "0",
              "bb": "1",
              "cc": "2"},
            checkedString: "aa",
            callback: (value) {
              setState(() => DDLog(value));
            }),

        PopupMenuButtonExt.fromCheckList(
            list: ["a", "b", "c"],
            checkedIdx: 1,
            callback: (value) {
              setState(() => DDLog(value));
            }),
      ],
    );
  }

  test() {
    var a = 85.99999;
    var b = 488.236;
    var c = 488.3;

    DDLog(a.toStringAsExponential(2));
    DDLog(a.toStringAsFixed(2));
    DDLog(a.toStringAsPrecision(2));

    "1111".printNew();
  }

  Widget buildUpdateAlert(BuildContext context) {
    return Container(
      child: Column( //Column控件用来垂直摆放子Widget
        // crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对⻬
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("新版本v ${2.0}").fontSize(20)
            // .padding(right: 20)
            //     .width(MediaQuery.of(context).size.width - 30)
            ,
            Text("""
          1、支持立体声蓝牙耳机，同时改善配对性能
          2、提供屏幕虚拟键盘
          3、更简洁更流畅，使用起来更快
          4、修复一些软件在使用时自动退出bug5、新增加了分类查看功能
          """).fontSize(14)
                .width(MediaQuery.of(context).size.width - 30),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    DDLog("以后再说");
                  },
                  child: Text("以后再说").fontSize(14),
                ),
                TextButton(
                  onPressed: () {
                    DDLog("立即升级");
                  },
                  child: Text("立即升级").fontSize(14)
                      .textColor(Colors.white)
                      .backgroundColor(Colors.blue),
                ),
              ],
            ),
          ]
      )
          .padding(top: 100, left: 15, bottom: 100, right: 15),
    );
  }

  void showAlertDialog(){
    final title = "新版本 v${2.1}";
    final message = """
        1、支持立体声蓝牙耳机，同时改善配对性能;
        2、提供屏幕虚拟键盘;
        3、更简洁更流畅，使用起来更快;
        4、修复一些软件在使用时自动退出bug;
        5、新增加了分类查看功能;
          """;

    // CupertinoAlertDialogExt.showAlert(context: context,
    //     title: title,
    //     message: message,
    //     actionTitles: ["取消", "确定"],
    //     callback: (value){
    //       if (value == "取消") {
    //         Navigator.of(context).pop();
    //       }
    //       DDLog(value);
    //     });
    // AlertDialogExt.showAlert(context);
  }

  void showAlertSheet(){
    final title = "新版本 v${2.1}";
    final message = """
        1、支持立体声蓝牙耳机，同时改善配对性能;
        2、提供屏幕虚拟键盘;
        3、更简洁更流畅，使用起来更快;
        4、修复一些软件在使用时自动退出bug;
        5、新增加了分类查看功能;
          """;

    // CupertinoActionSheetExt.showModalPopup(
    //     context: context,
    //     title: title,
    //     message: message,
    //     actionTitles: ["选择 1", "选择 2", "选择 3",],
    //     callback: (value){
    //       DDLog(value);
    //     });
    // return;

    final actions = [
      ListTile(
        leading: Icon(Icons.add),
        title: Text('Add account'),
        trailing: Icon(Icons.check),
        onTap: () {
          DDLog("account");
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Manage accounts'),
        onTap: () {
          DDLog("accounts");
        },
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text(
          "Your Profile",
        ),
        onTap: () {
          DDLog("Profile");
        },
      ),
    ]
    //     .map((e) => CupertinoActionSheetAction(onPressed: () {
    //   Navigator.pop(context);
    // }, child: e,)).toList()
    ;

    CupertinoActionSheetExt.showModalPopupWidgets(
      context: context,
      title: title,
      message: message,
      actionWidgets: actions,
    );
    return;
      CupertinoActionSheet(
          title: Text(title),
          // message: Text(message),
          actions: [
            CupertinoActionSheetAction(
              child: Text('1'),
              onPressed: () {
                print('pressed');
              },
            ),
            CupertinoActionSheetAction(
              child:  Material(
                type: MaterialType.transparency,
                child: ListTile(
                  contentPadding: EdgeInsets.only(top: -10, bottom: -10),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.add_a_photo),
                  title: Text(
                    "Your Profile",
                  ),
                  onTap: () {
                    debugPrint("Tapped Profile");
                    },
                ),
              ),
              onPressed: () {
                print('pressed');
              },

            ),
          ],
          cancelButton:
          CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ).show(context);
  }
}

///左侧抽屉菜单
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      // child: Image.asset(
                      //   "images/avatar.png",
                      //   width: 80,
                      // ),
                      child: FlutterLogo(size: 60,),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                    trailing: Icon(Icons.add_a_photo),
                    onTap: (){
                      DDLog(context);
                    },
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                    onTap: (){
                      DDLog(Icons.title);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      "Your Profile",
                    ),
                    onTap: (){
                      debugPrint("Tapped Profile");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}