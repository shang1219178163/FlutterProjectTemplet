import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

import 'DartExpand/ActionSheet_extension.dart';


class GridViewExample extends StatefulWidget {

  @override
  _GridViewExampleState createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {

  var titles = ["默认样式", "ListTile", "添加子视图", "3", "4", "5", "6", "7", "8"];

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
        ),
        // body: buildWrap(context).padding(all: 10)
        body: buildGridView(titles)

    );
  }


  void _onPressed(int e) {
    switch (e) {
      case 1:
        break;

      case 2:
        {
        }
        break;

      case 3:
        {

        }
        break;

      case 4:
        {

        }
        break;

      case 5:
        {

        }
        break;

      case 6:
        {

        }
        break;

      case 7:
        {

        }
        break;

      case 8:
        {

        }
        break;

      default:
        break;
    }

    DDLog(e);
  }

  Widget buildGridView(List<String> list) {
    return GridView.count(
      padding: EdgeInsets.all(15.0),
      //一行多少个
      crossAxisCount: 4,
      //滚动方向
      scrollDirection: Axis.vertical,
      // 左右间隔
      crossAxisSpacing: 8,
      // 上下间隔
      mainAxisSpacing: 8,
      //宽高比
      childAspectRatio: 3 / 4,

      children: initListWidget(list),
    );
  }

  List<Widget> initListWidget(List<String> list) {
    List<Widget> lists = [];
    for (var item in list) {
      lists.add(
          Container(
            child: Column(
              children: [
                FlutterLogo()
                .backgroundColor(Colors.lightBlue)
                    .expanded(flex: 2)
                ,
                Container(
                  // height: 50.0,
                  // width: 50.0,
                  color: Colors.lightGreen,
                  child: Text("${item}",),
                )
                    .expanded(flex: 1)
                ,
              ],
            ),
          )
          .border(all: 1, color: Colors.lightBlue,)
              .gestures(onTap: () => {
                DDLog("$item")
              }),
      );
    }
    return lists;
  }

  // List<Widget> initListWidget(List<String> list) {
  //   List<Widget> lists = [];
  //   for (var item in list) {
  //     lists.add(
  //         GestureDetector(
  //           child: Container(
  //             child: Column(
  //               children: [
  //                 FlutterLogo()
  //                     .expanded(flex: 2)
  //                 ,
  //                 Container(
  //                   height: 50.0,
  //                   // width: 50.0,
  //                   color: Colors.yellow,
  //                   child: Text("${item}",),
  //                 )
  //                     .expanded(flex: 1)
  //                 ,
  //               ],
  //             ),
  //           ),
  //           onTap: (){
  //             DDLog(item);
  //           },
  //       ),
  //     );
  //   }
  //   return lists;
  // }

}

