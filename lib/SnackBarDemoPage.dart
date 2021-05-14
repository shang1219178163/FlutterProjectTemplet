import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

final kUpdateContent = """
1、支持立体声蓝牙耳机，同时改善配对性能;
2、提供屏幕虚拟键盘;
3、更简洁更流畅，使用起来更快;
4、修复一些软件在使用时自动退出bug;
5、新增加了分类查看功能;
""";

class SnackBarDemoPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => SnackBarDemoPageState();
}

class SnackBarDemoPageState extends State<SnackBarDemoPage> {

  GlobalKey globalKey = GlobalKey();
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SnackBar'),
        ),
        body: Builder(builder: (BuildContext context) {
          return RepaintBoundary(
            key: globalKey,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // final snackBar = SnackBar(
                  //     content: Text('这是一个SnackBar'),
                  //     action: SnackBarAction(
                  //     label: '撤消',
                  //     onPressed: () {
                  //       // do something to undo
                  //       DDLog('撤消');
                  //     }
                  // ),
                  // );
                  final snackBar = buildSnackBar(context);

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('显示SnackBar'),
              ),
            ),
          );
        })
    );
  }


  // SnackBar buildFlushbar(BuildContext context) {
  //   return Flushbar(
  //     flushbarPosition: FlushbarPosition.TOP,
  //     message:
  //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
  //     duration: Duration(seconds: 3),
  //   )..show(context);
  // }

  SnackBar buildSnackBar(BuildContext context) {
    return SnackBar(
      content: Container(
        // color: Colors.yellow,
        // decoration: BoxDecoration(color: Colors.red,
        //     border: Border.all(width: 2.0, color: Colors.black),
        //     borderRadius: BorderRadius.circular(20)),
        // margin: EdgeInsets.fromLTRB(0, 0, 0, 175),
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        child: Text(kUpdateContent)
            // .padding(all: 8)
            // .backgroundColor(Colors.yellow)
      ,
      ).gestures(onTap: (){
        DDLog(kUpdateContent);
      }),

      padding: EdgeInsets.only(left: 13, right: 13),
      // backgroundColor: Colors.green,
      elevation: 1000,
      behavior: SnackBarBehavior.fixed,);
    }
  }
