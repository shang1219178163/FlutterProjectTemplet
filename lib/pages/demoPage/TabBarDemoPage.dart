import 'package:flutter/material.dart';
import 'package:fluttertemplet/APPThemeSettings.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/pages/FirstPage.dart';
import 'package:fluttertemplet/pages/SecondPage.dart';
import 'package:fluttertemplet/pages/ThirdPage.dart';
import 'package:fluttertemplet/pages/FourthPage.dart';
import 'package:fluttertemplet/pages/BatterLevelPage.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarDemoPage extends StatefulWidget {

  final String? title;

  TabBarDemoPage({ Key? key, this.title}) : super(key: key);

  @override
  _TabBarDemoPageState createState() => _TabBarDemoPageState();
}

class _TabBarDemoPageState extends State<TabBarDemoPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加

    return MaterialApp(
      // theme: APPThemeSettings.instance.themeData(),
      theme: Get.isDarkMode ? ThemeData.dark(): ThemeData.light(),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            // leading: Icon(Icons.arrow_back)
            //         // .gestures(onTap: ()=> ddlog("back")
            //           .gestures(onTap: (){ Navigator.pop(context); }),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_railway)),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bus)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_boat)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              FirstPage().center(),
              SecondPage().center(),
              ThirdPage().center(),
              FourthPage().center(),
              BatterLevelPage().center(),
              // Center(child: SecondPage()),
              // Center(child: ThirdPage()),
              // Center(child: FourthPage()),
            ],
          ),
        ),
      ),
    );
  }
}