import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/Provider/provider_list_demo.dart';
import 'package:fluttertemplet/pages/demoPage/TabBarViewDemo.dart';
import 'package:fluttertemplet/pages/demoPage/AbsorbPointerDemo.dart';
import 'package:fluttertemplet/pages/demoPage/AnimatedDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/BackdropFilterDemo.dart';
import 'package:fluttertemplet/pages/demoPage/ContextMenuActionDemo.dart';
import 'package:fluttertemplet/pages/demoPage/CupertinoFormDemo.dart';
import 'package:fluttertemplet/pages/demoPage/DateTimeDemo.dart';
import 'package:fluttertemplet/pages/demoPage/ExpandIconDemo.dart';
import 'package:fluttertemplet/pages/demoPage/ExpandIconDemoNew.dart';
import 'package:fluttertemplet/pages/demoPage/GithubRepoDemo.dart';
import 'package:fluttertemplet/pages/demoPage/GridViewDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/GridPaperDemo.dart';

import 'package:fluttertemplet/pages/demoPage/HudProgressDemo.dart';
import 'package:fluttertemplet/pages/demoPage/IndexedStackDemo.dart';
import 'package:fluttertemplet/pages/demoPage/LayoutBuilderDemo.dart';
import 'package:fluttertemplet/pages/demoPage/LocationPopView.dart';
import 'package:fluttertemplet/pages/demoPage/MenuDemo.dart';
import 'package:fluttertemplet/pages/demoPage/NestedScrollViewDemo.dart';
import 'package:fluttertemplet/pages/demoPage/NumberFormatDemo.dart';
import 'package:fluttertemplet/pages/demoPage/NumberStepperDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/ProgressHudDemo.dart';
import 'package:fluttertemplet/pages/demoPage/RecordListDemo.dart';
import 'package:fluttertemplet/pages/demoPage/ReorderableListViewDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/RichTextDemo.dart';
import 'package:fluttertemplet/pages/demoPage/SliverAppBarDemoPage.dart';

import 'package:fluttertemplet/Pages/APPNotFoundPage.dart';
import 'package:fluttertemplet/Pages/AppSettingsPage.dart';
import 'package:fluttertemplet/Pages/FirstPage.dart';
import 'package:fluttertemplet/Pages/FourthPage.dart';
import 'package:fluttertemplet/Pages/SecondPage.dart';
import 'package:fluttertemplet/Pages/ThirdPage.dart';
import 'package:fluttertemplet/pages/demoPage/banner_demo.dart';
import 'package:fluttertemplet/pages/demoPage/will_pop_scope_demo.dart';
import 'package:fluttertemplet/pages/system_icons_page.dart';
import 'package:fluttertemplet/pages/tabBar_reuse_page_demo.dart';
import 'package:fluttertemplet/pages/tabBar_tabBarView_demo.dart';
import 'package:fluttertemplet/pages/tabBar_pageView_demo.dart';


import 'package:fluttertemplet/Pages/demoPage/AlertDialogDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/AlertSheetDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/CupertinoTabScaffoldDemoPage.dart';
// import 'package:fluttertemplet/Pages/demoPage/GridViewDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/LocalNotifationDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/PageViewDemo.dart';
import 'package:fluttertemplet/Pages/demoPage/PickerDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/ProgressHudDemoNew.dart';
import 'package:fluttertemplet/Pages/demoPage/SnackBarDemoPage.dart';
import 'package:fluttertemplet/Pages/demoPage/TextFieldDemo.dart';
import 'package:fluttertemplet/Pages/demoPage/SlidableDemo.dart';
import 'package:fluttertemplet/pages/demoPage/CarouselSliderDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/DateTableDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/DraggableDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/DraggableScrollableSheetDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/ProgressIndicatorDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/RangerSliderDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/SegmentControlDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/SliverPersistentHeaderDemo.dart';
import 'package:fluttertemplet/pages/demoPage/StepperDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/TabBarDemoPage.dart';
import 'package:fluttertemplet/pages/demoPage/TableDemo.dart';

import 'package:fluttertemplet/pages/AppWebViewDemoPage.dart';
import 'package:fluttertemplet/pages/ForgetPasswordPage.dart';
import 'package:fluttertemplet/pages/LoginPage.dart';
import 'package:fluttertemplet/pages/LoginPage2.dart';
import 'package:fluttertemplet/pages/SigninPage.dart';
import 'package:fluttertemplet/Pages/textlessDemo.dart';
import 'package:fluttertemplet/pages/sliver_demo/sliver_family_demo.dart';

import 'package:fluttertemplet/pages/demoPage/FutureBuilderDemo.dart';
import 'package:fluttertemplet/pages/demoPage/StreamBuilderDemo.dart';
import 'package:fluttertemplet/pages/demoPage/AnimatedSwitcherDemo.dart';
import 'package:fluttertemplet/pages/demoPage/AnimatedWidgetDemo.dart';


import 'package:fluttertemplet/vendor/popover_demo.dart';

import 'package:get/get.dart';
import 'package:fluttertemplet/main.dart';

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
  static const animatedWidgetDemo = '/AnimatedWidgetDemo';
  static const animatedSwitcherDemo = '/AnimatedSwitcherDemo';

  static const textlessDemo = '/textlessDemo';
  static const alertDialogDemoPage = '/AlertDialogDemoPage';
  static const alertSheetDemoPage = '/AlertSheetDemoPage';
  static const systemIconsPage = '/IconsListPage';
  static const gridViewDemoPage = '/GridViewDemoPage';
  static const gridPaperDemo = '/GridPaperDemo';

  static const pageViewDemo = '/PageViewDemo';
  static const pageViewTabBarWidget = '/PageViewTabBarWidget';
  static const snackBarDemoPage = '/SnackBarDemoPage';
  static const cupertinoTabScaffoldDemo = '/CupertinoTabScaffoldDemoPage';
  static const pickerDemoPage = '/PickerDemoPage';
  static const datePickerPage = '/DatePickerPage';
  static const showSearchDemoPage = '/ShowSearchDemoPage';
  static const localNotifationDemoPage = '/LocalNotifationDemoPage';
  static const progressHudDemoNew = '/ProgressHudDemoNew';
  static const toastContext = '/ToastContext';
  static const toastNoContext = '/ToastNoContext';
  static const recordListDemo = '/RecordListDemo';
  static const slidableDemo = '/SlidaableDemo';
  static const settingsPage = '/AppSettingsPage';
  static const draggableDemoPage = '/DraggableDemoPage';
  // static const animatedIconDemoPage = '/AnimatedIconDemoPage';
  static const forgetPasswordPage = '/ForgetPasswordPage';
  static const dateTableDemoPage = '/DateTableDemoPage';
  static const segmentControlDemoPage = '/SegmentControlDemoPage';
  static const rangerSliderDemoPage = '/RangerSliderDemoPage';
  static const draggableScrollableSheetDemoPage = '/DraggableScrollableSheetDemoPage';
  static const progressIndicatorDemoPage = '/ProgressIndicatorDemoPage';
  static const appWebViewDemoPage = '/AppWebViewDemoPage';
  static const enlargeStrategyDemo = '/EnlargeStrategyDemo';
  static const sliverAppBarDemoPage = '/SliverAppBarDemoPage';
  static const sliverFamilyDemo = '/SliverFamilyDemo';
  static const sliverFamilyPageViewDemo = '/sliverFamilyPageViewDemo';

  static const hudProgressDemo = '/HudProgressDemo';
  static const reorderableListViewDemoPage = '/ReorderableListViewDemoPage';
  static const expandIconDemoNew = '/ExpandIconDemoNew';
  static const expandIconDemo = '/ExpandIconDemo';
  static const stepperDemoPage = '/StepperDemoPage';
  static const numberStepperDemoPage = '/NumberStepperDemoPage';
  static const tableViewDemoPage = '/TableViewDemoPage';
  static const githubRepoDemo = '/GithubRepoDemo';
  static const progressHudDemo = '/ProgressHudDemo';
  static const locationPopView = '/LocationPopView';
  static const backdropFilterDemo = '/BackdropFilterDemo';
  static const richTextDemo = '/RichTextDemo';
  static const numberFormatDemo = '/NumberFormatDemo';
  static const dateTimeDemo = '/DateTimeDemo';
  static const textFieldDemo = '/TextFieldDemo';
  static const cupertinoFormDemo = '/CupertinoFormDemo';
  static const contextMenuActionDemo = '/ContextMenuActionDemo';
  static const menuDemo = '/MenuDemo';
  static const providerRoute = '/ProviderRoute';
  static const providerListDemo = '/providerListDemo';
  static const sliverPersistentHeaderDemo = '/SliverPersistentHeaderDemo';
  static const layoutBuilderDemo = '/LayoutBuilderDemo';
  static const tableDemo = '/TableDemo';
  static const widgetDemoList = '/WidgetDemoList';

  static const futureBuilderDemo = '/FutureBuilderDemo';
  static const streamBuilderDemo = '/StreamBuilderDemo';
  static const nestedScrollViewDemo = '/NestedScrollViewDemo';

  static const popoverDemo = '/popoverDemo';
  static const tabBarTabBarViewDemo = '/tabBarTabBarViewDemo';
  static const tabBarPageViewDemo = '/tabBarPageViewDemo';
  static const tabBarPageViewDemoNew = '/tabBarPageViewDemoNew';
  static const tabBarReusePageDemo = '/tabBarReusePageDemo';
  static const absorbPointerDemo = '/AbsorbPointerDemo';
  static const willPopScopeDemo = '/WillPopScopeDemo';
  static const bannerDemo = '/bannerDemo';
  static const indexedStackDemo = '/IndexedStackDemo';

  // static final routes = <String, WidgetBuilder>{
  //   homePage: (context) => MyHomePage(),
  // };
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
      name: APPRouter.tabBarTabBarViewDemo,
      page: () => TabBarTabBarViewDemo(),
    ),

    GetPage(
      name: APPRouter.tabBarPageViewDemo,
      page: () => TabBarPageViewDemo(),
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
       name: APPRouter.textlessDemo,
       page: () => TextlessDemo(),
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
       name: APPRouter.systemIconsPage,
       page: () => SystemIconsPage(),
     ),

     GetPage(
       name: APPRouter.gridViewDemoPage,
       page: () => GridViewDemoPage(),
     ),

     GetPage(
       name: APPRouter.pageViewDemo,
       page: () => PageViewDemo(),
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
       name: APPRouter.progressHudDemoNew,
       page: () => ProgressHudDemoNew(),
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
       name: APPRouter.recordListDemo,
       page: () => RecordListDemo(),
     ),

     GetPage(
       name: APPRouter.slidableDemo,
       page: () => SlidableDemo(),
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
      name: APPRouter.hudProgressDemo,
      page: () => HudProgressDemo(),
    ),

    GetPage(
      name: APPRouter.reorderableListViewDemoPage,
      page: () => ReorderableListViewDemoPage(),
    ),

    GetPage(
      name: APPRouter.expandIconDemoNew,
      page: () => ExpandIconDemoNew(),
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

    // GetPage(
    //   name: APPRouter.animatedIconDemoPage,
    //   page: () => AnimatedIconDemoPage(),
    // ),

    GetPage(
      name: APPRouter.animatedDemoPage,
      page: () => AnimatedDemoPage(),
    ),

    GetPage(
      name: APPRouter.animatedSwitcherDemo,
      page: () => AnimatedSwitcherDemo(),
    ),

    GetPage(
      name: APPRouter.animatedWidgetDemo,
      page: () => AnimatedWidgetDemo(),
    ),

    GetPage(
      name: APPRouter.futureBuilderDemo,
      page: () => FutureBuilderDemo(),
    ),

    GetPage(
      name: APPRouter.streamBuilderDemo,
      page: () => StreamBuilderDemo(),
    ),

    GetPage(
      name: APPRouter.githubRepoDemo,
      page: () => GithubRepoDemo(),
    ),

    GetPage(
      name: APPRouter.progressHudDemo,
      page: () => ProgressHudDemo(),
    ),

    GetPage(
      name: APPRouter.locationPopView,
      page: () => LocationPopView(),
    ),

    GetPage(
      name: APPRouter.backdropFilterDemo,
      page: () => BackdropFilterDemo(),
    ),

    GetPage(
      name: APPRouter.richTextDemo,
      page: () => RichTextDemo(),
    ),

    GetPage(
      name: APPRouter.numberFormatDemo,
      page: () => NumberFormatDemo(),
    ),

    GetPage(
      name: APPRouter.dateTimeDemo,
      page: () => DateTimeDemo(),
    ),

    GetPage(
      name: APPRouter.textFieldDemo,
      page: () => TextFieldDemo(),
    ),

    GetPage(
      name: APPRouter.cupertinoFormDemo,
      page: () => CupertinoFormDemo(),
    ),

    GetPage(
      name: APPRouter.contextMenuActionDemo,
      page: () => ContextMenuActionDemo(),
    ),

    GetPage(
      name: APPRouter.menuDemo,
      page: () => MenuDemo(),
    ),

    GetPage(
      name: APPRouter.gridPaperDemo,
      page: () => GridPaperDemo(),
    ),

    GetPage(
      name: APPRouter.sliverPersistentHeaderDemo,
      page: () => SliverPersistentHeaderDemo(),
    ),

    GetPage(
      name: APPRouter.providerListDemo,
      page: () => ProviderListDemo(),
    ),

    GetPage(
      name: APPRouter.layoutBuilderDemo,
      page: () => LayoutBuilderDemo(),
    ),

    GetPage(
      name: APPRouter.tableDemo,
      page: () => TableDemo(),
    ),

    GetPage(
      name: APPRouter.sliverFamilyDemo,
      page: () => SliverFamilyDemo(),
    ),

    GetPage(
      name: APPRouter.sliverFamilyPageViewDemo,
      page: () => SliverFamilyPageViewDemo(),
    ),

    GetPage(
      name: APPRouter.nestedScrollViewDemo,
      page: () => NestedScrollViewDemo(),
    ),

    GetPage(
      name: APPRouter.popoverDemo,
      page: () => PopoverDemo(),
    ),

    GetPage(
      name: APPRouter.tabBarPageViewDemo,
      page: () => TabBarPageViewDemo(),
    ),

    GetPage(
      name: APPRouter.tabBarReusePageDemo,
      page: () => TabBarReusePageDemo(),
    ),

    GetPage(
      name: APPRouter.absorbPointerDemo,
      page: () => AbsorbPointerDemo(),
    ),

    GetPage(
      name: APPRouter.willPopScopeDemo,
      page: () => WillPopScopeDemo(),
    ),

    GetPage(
      name: APPRouter.bannerDemo,
      page: () => BannerDemo(),
    ),

    GetPage(
      name: APPRouter.indexedStackDemo,
      page: () => IndexedStackDemo(),
    ),

  ];

}
