import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertemplet/BasicWidget/WebViewPage.dart';
import 'CupertinoTabScaffoldDemoPage.dart';
import 'PickerDemoPage.dart';
import 'TextlessPage.dart';

import 'main.dart';
import 'AlertDialogDemoPage.dart';
import 'AlertSheetDemoPage.dart';
import 'BasicWidget/WebViewPage.dart';
import 'FirstPage.dart';
import 'FourthPage.dart';
import 'GridViewDemoPage.dart';
import 'IconsListPage.dart';
import 'PageViewDemoPage.dart';
import 'SecondPage.dart';
import 'SnackBarDemoPage.dart';
import 'TabBarDemoPage.dart';
import 'ThirdPage.dart';
import 'WidgetListPage.dart';


///https://www.jianshu.com/p/b9d6ec92926f
class FTRouter {
  static const homePage = 'app://MyHomePage';
  static const firstPage = 'app://FirstPage';
  static const secondPage = 'app://SecondPage';
  static const thirdPage = 'app://ThirdPage';
  static const fourthPage = 'app://FourthPage';
  static const tabBarDemo = 'app://TabBarDemo';
  static const widgetListPage = 'app://WidgetListPage';
  static const textlessPage = 'app://TextlessPage';
  static const alertDialogDemoPage = 'app://AlertDialogDemoPage';
  static const alertSheetDemoPage = 'app://AlertSheetDemoPage';
  static const iconsListPage = 'app://IconsListPage';
  static const gridViewDemoPage = 'app://GridViewDemoPage';
  static const pageViewDemoPage = 'app://PageViewDemoPage';
  static const pageViewTabBarWidget = 'app://PageViewTabBarWidget';
  static const snackBarDemoPage = 'app://SnackBarDemoPage';
  static const cupertinoTabScaffoldDemo = 'app://CupertinoTabScaffoldDemoPage';
  static const pickerDemoPage = 'app://PickerDemoPage';
  static const datePickerPage = 'app://DatePickerPage';


  static final routes = <String, WidgetBuilder>{
    homePage: (context) => MyHomePage(),
    firstPage: (context) => FirstPage(),
    secondPage: (context) => SecondPage(),
    thirdPage: (context) => ThirdPage(),
    fourthPage: (context) => FourthPage(),
    tabBarDemo: (context) => TabBarDemo(),
    widgetListPage: (context) => WidgetListPage(),
    textlessPage: (context) => TextlessPage(),
    alertDialogDemoPage: (context) => AlertDialogDemoPage(),
    alertSheetDemoPage: (context) => AlertSheetDemoPage(),
    iconsListPage: (context) => IconsListPage(),
    gridViewDemoPage: (context) => GridViewDemoPage(),
    pageViewDemoPage: (context) => PageViewDemoPage(),
    pageViewTabBarWidget: (context) => PageViewTabBarWidget(),
    snackBarDemoPage: (context) => SnackBarDemoPage(),
    cupertinoTabScaffoldDemo: (context) => CupertinoTabScaffoldDemoPage(),
    pickerDemoPage: (context) => PickerDemoPage(),
    datePickerPage: (context) => DatePickerPage(),
  };

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url: url, params: params,);
    }

    dynamic page = Container(child: Text("404, 页面休假了!"),);
    switch (url) {
      case homePage:
        page = MyHomePage();
        break;

      case firstPage:
        page = FirstPage();
        break;

      case secondPage:
        page = SecondPage();
        break;

      case thirdPage:
        page = ThirdPage();
        break;

      case fourthPage:
        page = FourthPage();
        break;

      case tabBarDemo:
        page = TabBarDemo();
        break;

      case widgetListPage:
        page = WidgetListPage();
        break;

      case textlessPage:
        page = TextlessPage();
        break;

      case alertDialogDemoPage:
        page = AlertDialogDemoPage();
        break;

      case alertSheetDemoPage:
        page = AlertSheetDemoPage();
        break;

      case iconsListPage:
        page = IconsListPage();
        break;

      case gridViewDemoPage:
        page = GridViewDemoPage();
        break;

      case pageViewDemoPage:
        page = PageViewDemoPage();
        break;

      case pageViewTabBarWidget:
        page = PageViewTabBarWidget();
        break;

      case snackBarDemoPage:
        page = SnackBarDemoPage();
        break;
    }
    return page;
  }




//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  // Router.pushNoParams(BuildContext context, String url) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return _getPage(url, null);
  //   }));
  // }

  // ignore: unnecessary_question_mark
  FTRouter.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
