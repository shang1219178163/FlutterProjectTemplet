
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/Model/AppUpdateItemModel.dart';

class UpdateAppCard extends StatelessWidget {
  final data;

  const UpdateAppCard({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( //用Column将上下两部分合体
        crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对⻬
        children: <Widget>[
          buildTopRow(context), //上半部分
          buildBottomRow(context) //下半部分
        ]
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Row( //Row控件，用来水平摆放子Widget
        children: <Widget>[
          Padding( //Paddng控件，用来设置Image控件边距
            padding: EdgeInsets.all(10), //上下左右边距均为1
            child: ClipRRect( //圆⻆矩形裁剪控件
                borderRadius: BorderRadius.circular(8.0), //圆⻆半径为8
                // child: Image.asset(data.appIcon, width: 60, height: 60),
                child: FlutterLogo(size: 60,),
            ),
          ),
          Expanded( //Expanded控件，用来拉伸中间区域
            child: Column( //Column控件，用来垂直摆放子Widget
              mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对⻬
              crossAxisAlignment: CrossAxisAlignment.start, //水平方向居左对⻬
              children: <Widget>[
                Text(data.appName, maxLines: 1, overflow: TextOverflow.ellipsis), //App名字
                Text(data.appDate, maxLines: 1), //App更新日期
              ],
            ),
          ),
          Padding( //Paddng控件，用来设置Widget间边距
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            //右边距为10，其余均为0 child: FlatButton(//按钮控件
            child: ElevatedButton(
              onPressed: () => DDLog('Make a Note'),
              child: Row(
                children: [
                  Text("更新"),
                  // SizedBox(width: 5),
                  // Icon(Icons.send),
                ],
              ),
            ),
          )
        ]
    );
  }

  Widget buildBottomRow(BuildContext context) {
    return Padding( //Padding控件用来设置整体边距
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0), //左边距和右边距为15
        child: Column( //Column控件用来垂直摆放子Widget
            crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对⻬
            children: <Widget>[
              Text(data.appDescription), //更新文案
              Padding( //Padding控件用来设置边距
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0), //上边距为10
                  child: Text("${data.appVersion} • ${data.appSize} MB")
              )
            ]
        )
            // .backgroundColor(Colors.greenAccent)
    )
        // .backgroundColor(Colors.yellow)
    ;
  }
}




class NNListUpdateAppWidget extends StatelessWidget {

  final List<AppUpdateItemModel> list;

  const NNListUpdateAppWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      cacheExtent: 180,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final data = list[index];
        return UpdateAppCard(data: data);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
          indent: 15,
          endIndent: 15,
          color: Color(0xFFDDDDDD),
          // color: Colors.red,
        );
      },
    );
  }
}


