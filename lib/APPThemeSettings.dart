//
//  APPThemeSettings.dart
//  fluttertemplet
//
//  Created by shang on 7/14/21 2:18 PM.
//  Copyright © 7/14/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:get/get.dart';

import 'dartExpand/Widget_extension.dart';

class APPThemeSettings{
  APPThemeSettings._internal() {
    // 初始化
  }

  static final APPThemeSettings instance = APPThemeSettings._internal();


  List<ThemeData> _themes = [
    ThemeData(
      primarySwatch: Colors.blue,
      // brightness: Brightness.dark,//设置明暗模式为暗色
      // accentColor: Colors.black,//(按钮）Widget前景色为黑色
      // primaryColor: Colors.lightBlue,//主色调为青色
      splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
      highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
      iconTheme:IconThemeData(color: Colors.yellow),//设置icon主题色为黄色
      // textTheme: TextTheme(body1: TextStyle(color: Colors.red))//设置文本颜色为红色
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(),
        ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        // style: ButtonStyle(
        //   foregroundColor: MaterialStateProperty.resolveWith((states) {
        //     ddlog(states);
        //     return states.contains(MaterialState.pressed)
        //         ? Colors.blue
        //         : Colors.red;
        //   }),
        // )
        ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle()
        ),
    ),
  ];

  int _index = 0;

  // Color? primaryColor;

  ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    // brightness: Brightness.dark,//设置明暗模式为暗色
    // accentColor: Colors.black,//(按钮）Widget前景色为黑色
    // primaryColor: Colors.lightBlue,//主色调为青色
    splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
    highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
    iconTheme: IconThemeData(color: Colors.yellow),//设置icon主题色为黄色
    // textTheme: TextTheme(body1: TextStyle(color: Colors.red))//设置文本颜色为红色
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      // style: ButtonStyle(
      //   foregroundColor: MaterialStateProperty.resolveWith((states) {
      //     ddlog(states);
      //     return states.contains(MaterialState.pressed)
      //         ? Colors.blue
      //         : Colors.red;
      //   }),
      // )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle()
    ),
  );

  // ThemeData? darkThemeData;
  ThemeData darkThemeData = ThemeData.dark().copyWith(
    accentColor: Colors.tealAccent[200]!,
    // brightness: Brightness.dark,//设置明暗模式为暗色
    // accentColor: Colors.grey[900]!,//(按钮）Widget前景色为黑色
    // primaryColor: Colors.white,//主色调为青色
    // splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
    // highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
    // iconTheme: IconThemeData(color: Colors.white54),//设置icon主题色为黄色
    // // textTheme: TextTheme(body1: TextStyle(color: Colors.red))//设置文本颜色为红色
    buttonColor: Colors.tealAccent[200]!,
    // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    // appBarTheme: ThemeData.dark().appBarTheme.copyWith(
    //   color: Colors.black54,
    // ),
    // indicatorColor: Colors.white,
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStateProperty.all(Colors.tealAccent[200]!),
    //     textStyle: MaterialStateProperty.all(TextStyle(color: Colors.tealAccent[200]!)),
    //   ),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all(Colors.tealAccent[200]!),
    //     )
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStateProperty.all(Colors.tealAccent[200]!),
    //     // textStyle: MaterialStateProperty.all(TextStyle(color: e)),
    //   ),
    // ),
  );

  late ScrollController? actionScrollController = ScrollController();

  void showThemePicker({required BuildContext context, required void callback()}) {
    showCupertinoModalPopup(context: context,
        builder: (context) => CupertinoActionSheet(
          actionScrollController: actionScrollController,
          title: Text("请选择主题色"),
          // message: Text(message),
          actions: colors.map((e) => Container(
            color: e,
            child: Column(children: [
              SizedBox(height: 18,),
              GestureDetector(
                child: Text(e.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    backgroundColor: e,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: (){
                  changeThemeLight(e);
                  Navigator.pop(context);
                  callback();
                },
              ),
              SizedBox(height: 18,),
            ],))

          ).toList(),
          cancelButton: CupertinoActionSheetAction(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
    );
  }


  void changeTheme() {
    // Get.changeTheme(Get.isDarkMode? ThemeData.light() : ThemeData.dark());
    Get.changeTheme(Get.isDarkMode? themeData : darkThemeData);
    return;
    Get.changeTheme(Get.isDarkMode? ThemeData.light().copyWith(
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.orange,
        ),
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
        // accentColor: Colors.white,
        buttonColor: Colors.blue,
        iconTheme: ThemeData.light().iconTheme.copyWith(
            color: Colors.blue
        ),

    ) : ThemeData.dark().copyWith(
        floatingActionButtonTheme: ThemeData.dark().floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.green,
        ),
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
        // accentColor: Colors.red
        iconTheme: ThemeData.dark().iconTheme.copyWith(
            color: Colors.white60
        )
      )
    );
  }

  void changeThemeLight(Color e) {
    themeData = ThemeData.light().copyWith(
      primaryColor: e,
      splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
      highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
      accentColor: e,
      buttonColor: e,
      indicatorColor: Colors.white,
      iconTheme: ThemeData.light().iconTheme.copyWith(
        color: e,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        // bodyColor: Colors.pink,
        // displayColor: Colors.pink,
        decoration: TextDecoration.none,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(e),
          // textStyle: MaterialStateProperty.all(TextStyle(color: Colors.red)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(e),
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(e),
          // textStyle: MaterialStateProperty.all(TextStyle(color: e)),
        ),
      ),
      switchTheme: ThemeData.light().switchTheme.copyWith(
        // thumbColor: e,
          trackColor: MaterialStateProperty.all(e)
      ),
      bottomNavigationBarTheme: ThemeData.light().bottomNavigationBarTheme.copyWith(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: e,
        selectedIconTheme: IconThemeData(color: e),

        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: e,
        // textTheme:
        // primaryContrastingColor: Colors.red,
        // barBackgroundColor: Colors.red,
        // scaffoldBackgroundColor: Colors.red,
      ),
    );
    Get.changeTheme(themeData);
  }

  final List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.teal,
    Colors.pink,
    Colors.amber,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.lightBlue,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey
  ];
}