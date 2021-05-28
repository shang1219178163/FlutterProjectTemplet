import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertemplet/basicWidget/WebViewPage.dart';
import 'package:fluttertemplet/Pages/APPNotFoundPage.dart';
import 'package:fluttertemplet/Pages/AppSettingsPage.dart';
import 'package:fluttertemplet/Pages/FirstPage.dart';
import 'package:fluttertemplet/Pages/FourthPage.dart';
import 'package:fluttertemplet/Pages/IconsListPage.dart';
import 'package:fluttertemplet/Pages/SecondPage.dart';
import 'package:fluttertemplet/Pages/ThirdPage.dart';
import 'package:fluttertemplet/Pages/WidgetListPage.dart';
import 'package:fluttertemplet/Pages/demoPage/AlertDialogDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/AlertSheetDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/CupertinoTabScaffoldDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/GridViewDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/LocalNotifationDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/PageViewDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/PickerDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/ProgressHudDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/SnackBarDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/TabBarDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/TextFieldDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/flutterSlidableDemoPage.dart';
import 'package:fluttertemplet/Pages/textlessPage.dart';
import 'package:fluttertemplet/main.dart';



///https://www.jianshu.com/p/b9d6ec92926f
class APPRouter {
  static const NotFound = '/APPNotFoundPage';

  static const homePage = '/MyHomePage';
  static const firstPage = '/FirstPage';
  static const secondPage = '/SecondPage';
  static const thirdPage = '/ThirdPage';
  static const fourthPage = '/FourthPage';
  static const tabBarDemo = '/TabBarDemo';
  static const widgetListPage = '/WidgetListPage';
  static const textlessPage = '/TextlessPage';
  static const alertDialogDemoPage = '/AlertDialogDemoPage';
  static const alertSheetDemoPage = '/AlertSheetDemoPage';
  static const iconsListPage = '/IconsListPage';
  static const gridViewDemoPage = '/GridViewDemoPage';
  static const pageViewDemoPage = '/PageViewDemoPage';
  static const pageViewTabBarWidget = '/PageViewTabBarWidget';
  static const snackBarDemoPage = '/SnackBarDemoPage';
  static const cupertinoTabScaffoldDemo = '/CupertinoTabScaffoldDemoPage';
  static const pickerDemoPage = '/PickerDemoPage';
  static const datePickerPage = '/DatePickerPage';
  static const showSearchDemoPage = '/ShowSearchDemoPage';
  static const localNotifationDemoPage = '/LocalNotifationDemoPage';
  static const progressHudDemoPage = '/ProgressHudDemoPage';
  static const toastContext = '/ToastContext';
  static const toastNoContext = '/ToastNoContext';
  static const textFieldDemoPage = '/TextFieldDemoPage';
  static const flutterSlidableDemoPage = '/FlutterSlidableDemoPage';
  static const settingsPage = '/AppSettingsPage';


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
    localNotifationDemoPage: (context) => LocalNotifationDemoPage(),
    progressHudDemoPage: (context) => ProgressHudDemoPage(),
    toastContext: (context) => ToastContext(),
    toastNoContext: (context) => ToastNoContext(),
    textFieldDemoPage: (context) => TextFieldDemoPage(),
    flutterSlidableDemoPage: (context) => FlutterSlidableDemoPage(),
    NotFound: (context) => APPNotFoundPage(),
    settingsPage: (context) => AppSettingsPage(),

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

  static int countAs(String string, {Object? args,}) {
    int total = string.length;
    int diff = string.replaceAll("A", "").length;
    return total - diff;
  }


  APPRouter.push(BuildContext context, String url, {Object? args,}) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WebViewPage(url: url, params: args);
      }));
      return;
    }
    
    if (!APPRouter.routes.keys.contains(url)){
      Navigator.pushNamed(context, APPRouter.NotFound, arguments: args);
      return;
    }
    Navigator.pushNamed(context, url, arguments: args);
    return;

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return _getPage(url, args);
    // }));
  }
}
