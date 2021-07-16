import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/pages/demoPage/AnimatedDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/ExpandIconDemo.dart';
import 'package:fluttertemplet/pages/demoPage/ExpandIconDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/HudProgressDemoWidget.dart';
import 'package:fluttertemplet/pages/demoPage/NumberStepperDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/ReorderableListViewDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/SliverAppBarDemoPage.dart';

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
import 'package:fluttertemplet/Pages/demoPage/TextFieldDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/flutterSlidableDemoPage.dart';
import 'package:fluttertemplet/pages/AppWebViewDemoPage.dart';
import 'package:fluttertemplet/pages/ForgetPasswordPage.dart';
import 'package:fluttertemplet/pages/LoginPage.dart';
import 'package:fluttertemplet/pages/LoginPage2.dart';
import 'package:fluttertemplet/pages/SigninPage.dart';
import 'package:fluttertemplet/pages/demoPage/CarouselSliderDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/DateTableDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/DraggableDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/DraggableScrollableSheetDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/ProgressIndicatorDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/RangerSliderDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/SegmentControlDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/StepperDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/TabBarDemoPage.dart';

import 'package:fluttertemplet/Pages/textlessPage.dart';
import 'package:fluttertemplet/main.dart';
import 'package:fluttertemplet/pages/demoPage/TableViewDemoPage.dart';
import 'package:get/get.dart';



///https://www.jianshu.com/p/b9d6ec92926f
class APPRouter {
  static const notFound = '/APPNotFoundPage';

  static const homePage = '/MyHomePage';
  static const loginPage = '/LoginPage';
  static const loginPage2 = '/LoginPage2';

  static const signinPage = '/SigninPage';

  static const firstPage = '/FirstPage';
  static const secondPage = '/SecondPage';
  static const thirdPage = '/ThirdPage';
  static const fourthPage = '/FourthPage';
  static const tabBarDemoPage = '/TabBarDemoPage';
  static const widgetListPage = '/WidgetListPage';
  static const animatedDemoPage = '/AnimatedDemoPage';

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
  static const slidableDemoPage = '/FlutterSlidaableDemoPage';
  static const settingsPage = '/AppSettingsPage';
  static const draggableDemoPage = '/DraggableDemoPage';
  static const animatedIconDemoPage = '/AnimatedIconDemoPage';
  static const forgetPasswordPage = '/ForgetPasswordPage';
  static const dateTableDemoPage = '/DateTableDemoPage';
  static const segmentControlDemoPage = '/SegmentControlDemoPage';
  static const rangerSliderDemoPage = '/RangerSliderDemoPage';
  static const draggableScrollableSheetDemoPage = '/DraggableScrollableSheetDemoPage';
  static const progressIndicatorDemoPage = '/ProgressIndicatorDemoPage';
  static const appWebViewDemoPage = '/AppWebViewDemoPage';
  static const enlargeStrategyDemo = '/EnlargeStrategyDemo';
  static const sliverAppBarDemoPage = '/SliverAppBarDemoPage';
  static const hudProgressDemoWidget = '/HudProgressDemoWidget';
  static const reorderableListViewDemoPage = '/ReorderableListViewDemoPage';
  static const expandIconDemoPage = '/ExpandIconDemoPage';
  static const expandIconDemo = '/ExpandIconDemo';
  static const stepperDemoPage = '/StepperDemoPage';
  static const numberStepperDemoPage = '/NumberStepperDemoPage';
  static const tableViewDemoPage = '/TableViewDemoPage';


  // static final routes = <String, WidgetBuilder>{
  //   homePage: (context) => MyHomePage(),
  //   firstPage: (context) => FirstPage(),
  //   secondPage: (context) => SecondPage(),
  //   thirdPage: (context) => ThirdPage(),
  //   fourthPage: (context) => FourthPage(),
  //   tabBarDemo: (context) => TabBarDemo(),
  //   widgetListPage: (context) => WidgetListPage(),
  //   textlessPage: (context) => TextlessPage(),
  //   alertDialogDemoPage: (context) => AlertDialogDemoPage(),
  //   alertSheetDemoPage: (context) => AlertSheetDemoPage(),
  //   iconsListPage: (context) => IconsListPage(),
  //   gridViewDemoPage: (context) => GridViewDemoPage(),
  //   pageViewDemoPage: (context) => PageViewDemoPage(),
  //   pageViewTabBarWidget: (context) => PageViewTabBarWidget(),
  //   snackBarDemoPage: (context) => SnackBarDemoPage(),
  //   cupertinoTabScaffoldDemo: (context) => CupertinoTabScaffoldDemoPage(),
  //   pickerDemoPage: (context) => PickerDemoPage(),
  //   datePickerPage: (context) => DatePickerPage(),
  //   localNotifationDemoPage: (context) => LocalNotifationDemoPage(),
  //   progressHudDemoPage: (context) => ProgressHudDemoPage(),
  //   toastContext: (context) => ToastContext(),
  //   toastNoContext: (context) => ToastNoContext(),
  //   textFieldDemoPage: (context) => TextFieldDemoPage(),
  //   slidableDemoPage: (context) => FlutterSlidableDemoPage(),
  //   notFound: (context) => APPNotFoundPage(),
  //   settingsPage: (context) => AppSettingsPage(),
  //   draggableDemoPage: (context) => DraggableDemoPage(),
  //
  // };

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  // Widget _getPage(String url, dynamic params) {
  //   if (url.startsWith('https://') || url.startsWith('http://')) {
  //     return WebViewPage(url: url, params: params,);
  //   }
  //
  //   dynamic page = Container(child: Text("404, 页面休假了!"),);
  //   switch (url) {
  //     case homePage:
  //       page = MyHomePage();
  //       break;
  //
  //     case firstPage:
  //       page = FirstPage();
  //       break;
  //
  //     case secondPage:
  //       page = SecondPage();
  //       break;
  //
  //     case thirdPage:
  //       page = ThirdPage();
  //       break;
  //
  //     case fourthPage:
  //       page = FourthPage();
  //       break;
  //
  //     case tabBarDemo:
  //       page = TabBarDemo();
  //       break;
  //
  //     case widgetListPage:
  //       page = WidgetListPage();
  //       break;
  //
  //     case textlessPage:
  //       page = TextlessPage();
  //       break;
  //
  //     case alertDialogDemoPage:
  //       page = AlertDialogDemoPage();
  //       break;
  //
  //     case alertSheetDemoPage:
  //       page = AlertSheetDemoPage();
  //       break;
  //
  //     case iconsListPage:
  //       page = IconsListPage();
  //       break;
  //
  //     case gridViewDemoPage:
  //       page = GridViewDemoPage();
  //       break;
  //
  //     case pageViewDemoPage:
  //       page = PageViewDemoPage();
  //       break;
  //
  //     case pageViewTabBarWidget:
  //       page = PageViewTabBarWidget();
  //       break;
  //
  //     case snackBarDemoPage:
  //       page = SnackBarDemoPage();
  //       break;
  //   }
  //   return page;
  // }

  // static int countAs(String text, {Object? arguments,}) {
  //   int total = text.length;
  //   int diff = text.replaceAll("A", "").length;
  //   return total - diff;
  // }
  //
  //
  // APPRouter.push(BuildContext context, String url, {Object? arguments,}) {
  //   if (url.startsWith('https://') || url.startsWith('http://')) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return WebViewPage(url: url, params: arguments);
  //     }));
  //     return;
  //   }
  //
  //   if (!APPRouter.routes.keys.contains(url)){
  //     // Navigator.pushNamed(context, APPRouter.NotFound, arguments: arguments);
  //     Get.toNamed(APPRouter.notFound, arguments: arguments);
  //     return;
  //   }
  //   Navigator.pushNamed(context, url, arguments: arguments);
  //   // Get.toNamed(url, arguments: args);
  //   return;
  //
  //   // Navigator.push(context, MaterialPageRoute(builder: (context) {
  //   //   return _getPage(url, args);
  //   // }));
  // }
}


class AppPage{

  static const INITIAL = APPRouter.homePage;

  static final unknownRoute = GetPage(
    name: APPRouter.notFound,
    page: () => APPNotFoundPage(),
  );

  static final List<GetPage> routes = [
    GetPage(
      name: APPRouter.homePage,
      page: () => MyHomePage(),
    ),

    GetPage(
      name: APPRouter.loginPage,
      page: () => LoginPage(),
      // transition: Transition.downToUp,
    ),

    GetPage(
      name: APPRouter.loginPage2,
      page: () => LoginPage2(),
      // transition: Transition.downToUp,
    ),

    GetPage(
      name: APPRouter.forgetPasswordPage,
      page: () => ForgetPasswordPage(),
    ),


    GetPage(
      name: APPRouter.signinPage,
      page: () => SigninPage(),
    ),

     GetPage(
       name: APPRouter.firstPage,
       page: () => FirstPage(),
     ),

     GetPage(
       name: APPRouter.secondPage,
       page: () => SecondPage(),
     ),

     GetPage(
       name: APPRouter.thirdPage,
       page: () => ThirdPage(),
     ),

     GetPage(
       name: APPRouter.fourthPage,
       page: () => FourthPage(),
     ),

     GetPage(
       name: APPRouter.tabBarDemoPage,
       page: () => TabBarDemoPage(),
     ),

     GetPage(
       name: APPRouter.widgetListPage,
       page: () => WidgetListPage(),
     ),

     GetPage(
       name: APPRouter.textlessPage,
       page: () => TextlessPage(),
     ),

     GetPage(
       name: APPRouter.alertDialogDemoPage,
       page: () => AlertDialogDemoPage(),
     ),

     GetPage(
       name: APPRouter.alertSheetDemoPage,
       page: () => AlertSheetDemoPage(),
     ),

     GetPage(
       name: APPRouter.iconsListPage,
       page: () => IconsListPage(),
     ),

     GetPage(
       name: APPRouter.gridViewDemoPage,
       page: () => GridViewDemoPage(),
     ),

     GetPage(
       name: APPRouter.pageViewDemoPage,
       page: () => PageViewDemoPage(),
     ),

     GetPage(
       name: APPRouter.pageViewTabBarWidget,
       page: () => PageViewTabBarWidget(),
     ),

     GetPage(
       name: APPRouter.snackBarDemoPage,
       page: () => SnackBarDemoPage(),
     ),

     GetPage(
       name: APPRouter.cupertinoTabScaffoldDemo,
       page: () => CupertinoTabScaffoldDemoPage(),
     ),

     GetPage(
       name: APPRouter.pickerDemoPage,
       page: () => PickerDemoPage(),
     ),

     GetPage(
       name: APPRouter.datePickerPage,
       page: () => DatePickerPage(),
     ),

     GetPage(
       name: APPRouter.localNotifationDemoPage,
       page: () => LocalNotifationDemoPage(),
     ),

     GetPage(
       name: APPRouter.progressHudDemoPage,
       page: () => ProgressHudDemoPage(),
     ),

     GetPage(
       name: APPRouter.toastContext,
       page: () => ToastContext(),
     ),

     GetPage(
       name: APPRouter.toastNoContext,
       page: () => ToastNoContext(),
     ),

     GetPage(
       name: APPRouter.textFieldDemoPage,
       page: () => TextFieldDemoPage(),
     ),

     GetPage(
       name: APPRouter.slidableDemoPage,
       page: () => FlutterSlidableDemoPage(),
     ),

     GetPage(
       name: APPRouter.settingsPage,
       page: () => AppSettingsPage(),
     ),

    GetPage(
      name: APPRouter.draggableDemoPage,
      page: () => DraggableDemoPage(),
    ),

    GetPage(
      name: APPRouter.dateTableDemoPage,
      page: () => DateTableDemoPage(),
    ),

    GetPage(
      name: APPRouter.segmentControlDemoPage,
      page: () => SegmentControlDemoPage(),
    ),

    GetPage(
      name: APPRouter.rangerSliderDemoPage,
      page: () => RangerSliderDemoPage(),
    ),

    GetPage(
      name: APPRouter.draggableScrollableSheetDemoPage,
      page: () => DraggableScrollableSheetDemoPage(),
    ),

    GetPage(
      name: APPRouter.progressIndicatorDemoPage,
      page: () => ProgressIndicatorDemoPage(),
    ),

    GetPage(
      name: APPRouter.appWebViewDemoPage,
      page: () => AppWebViewDemoPage(),
    ),

    GetPage(
      name: APPRouter.enlargeStrategyDemo,
      page: () => CarouselSliderDemoPage(),
    ),

    GetPage(
      name: APPRouter.sliverAppBarDemoPage,
      page: () => SliverAppBarDemoPage(),
    ),

    GetPage(
      name: APPRouter.hudProgressDemoWidget,
      page: () => HudProgressDemoWidget(),
    ),

    GetPage(
      name: APPRouter.reorderableListViewDemoPage,
      page: () => ReorderableListViewDemoPage(),
    ),

    GetPage(
      name: APPRouter.expandIconDemoPage,
      page: () => ExpandIconDemoPage(),
    ),

    GetPage(
      name: APPRouter.expandIconDemo,
      page: () => ExpandIconDemo(),
    ),

    GetPage(
      name: APPRouter.stepperDemoPage,
      page: () => StepperDemoPage(),
    ),

    GetPage(
      name: APPRouter.numberStepperDemoPage,
      page: () => NumberStepperDemoPage(),
    ),

    GetPage(
      name: APPRouter.animatedDemoPage,
      page: () => AnimatedDemoPage(),
    ),

    GetPage(
      name: APPRouter.tableViewDemoPage,
      page: () => TableViewDemoPage(),
    ),

  ];

}