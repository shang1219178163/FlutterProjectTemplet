import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplet/APPThemeSettings.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';
import 'package:fluttertemplet/Pages/APPUserCenterPage.dart';
import 'package:fluttertemplet/Pages/demoPage/TabBarDemoPage.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'Pages/APPDrawerMenuPage.dart';
import 'Pages/APPUserCenterPage.dart';
import 'package:fluttertemplet/dartExpand/PopupMenuButton_extension.dart';
import 'package:fluttertemplet/dartExpand/AlertDialog_extension.dart';

import 'Pages/FirstPage.dart';
import 'Pages/SecondPage.dart';
import 'Pages/ThirdPage.dart';
import 'Pages/FourthPage.dart';
import 'Pages/TextlessPage.dart';

import 'Pages/ListPageController.dart';

import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/dartExpand/Widget_extension.dart';

import 'NNListWidgetPage.dart';
import 'Pages/ListPageController.dart';
import 'Pages/WidgetListPage.dart';
import 'routes/APPRouter.dart';


Future<void> main() async {
  await initServices();
  // AppInit.catchException(() => runApp(MyApp()));
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services ...');
  // await Get.putAsync(() => GlobalConfigService().init());
  // await Get.putAsync(SettingsService()).init();
  print('All services started...');
}

///全局
final GlobalKey<NavigatorState> navigatorState = GlobalKey();

class MyApp extends StatelessWidget {
  // This widget is the root of your aptplication.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: navigatorState,
      title: 'Flutter Templet',
      // theme: APPThemeSettings.instance.themeData(),
      // darkTheme: APPThemeSettings.instance.darkThemeData,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: "/MyHomePage",
      // routes: kRoutes,
      initialRoute: AppPage.INITIAL,
      getPages: AppPage.routes,
      unknownRoute: AppPage.unknownRoute,
      routingCallback: (routing){
        if (routing != null) {
          ddlog([routing.previous, routing.current]);
        }
      },
      // routes: {
    //     "/": (context) => MyHomePage(),
    //     "/TwoPage": (context) => TwoPage(),
    //   },
    );
  }
}

final GlobalKey<ScaffoldState> kScaffoldKey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final pages = [
    WidgetListPage(),
    SecondPage(),
    TabBarDemoPage(),
    ThirdPage(),
    // FourthPage(),
    APPUserCenterPage()
  ];

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
      ddlog(currentIndex);
    }
  }

  // void openDrawer() {
  //   scaffoldKey.currentState!.openDrawer();
  // }
  //
  // void closeDrawer() {
  //   Navigator.of(context).pop();
  // }

  //lifecycle
  @override
  void initState() {
    // TODO: implement initState
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kScaffoldKey,
      // drawer: MyDrawer(),
      drawer: APPDrawerMenuPage(),

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
      // body: PageView(onPageChanged: (index){
      //     _changePage(index);
      //   },
      //     children: pages,
      // ),

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
          .gestures(onTap: () => ddlog("back")),
      //导航条右边的一组组件
      actions: [
        // Icon(Icons.settings)
        //     .padding(right: 8)
        //     .gestures(onTap: ()=> ddlog("settings")),
        // Icon(Icons.search)
        //     // .padding(right: 8)
        //     .gestures(onTap: ()=> ddlog("search")),

        PopupMenuButtonExt.fromEntryFromJson(
            json: {"aa": "0",
              "bb": "1",
              "cc": "2"},
            checkedString: "aa",
            callback: (value) {
              setState(() => ddlog(value));
            }),

        PopupMenuButtonExt.fromCheckList(
            list: ["a", "b", "c"],
            checkedIdx: 1,
            callback: (value) {
              setState(() => ddlog(value));
            }),
      ],
    );
  }

  test() {
    var a = 85.99999;
    var b = 488.236;
    var c = 488.3;

    ddlog(a.toStringAsExponential(2));
    ddlog(a.toStringAsFixed(2));
    ddlog(a.toStringAsPrecision(2));

    // "1111".printNew();
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
                    ddlog("以后再说");
                  },
                  child: Text("以后再说").fontSize(14),
                ),
                TextButton(
                  onPressed: () {
                    ddlog("立即升级");
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
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                      ddlog(context);
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
                      ddlog(Icons.title);
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