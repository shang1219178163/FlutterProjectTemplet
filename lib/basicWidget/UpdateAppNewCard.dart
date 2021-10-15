
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';

import 'package:fluttertemplet/Model/AppUpdateItemModel.dart';

class UpdateAppNewCard extends StatefulWidget {
  final data;

  UpdateAppNewCard({Key? key, required this.data}) : super(key: key);

  @override
  _UpdateAppNewCardState createState() => _UpdateAppNewCardState();
}

class _UpdateAppNewCardState extends State<UpdateAppNewCard> {
  bool isShowAll = false;

  void _changeState() {
    setState(() {
      isShowAll = !isShowAll;
      ddlog(isShowAll);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column( //用Column将上下两部分合体
        crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对⻬
        children: <Widget>[
          buildTopRow(context), //上半部分
          buildBottomRowNew(context) //下半部分
        ]
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Row( //Row控件，用来水平摆放子Widget
        children: <Widget>[
          ClipRRect( //圆⻆矩形裁剪控件
            borderRadius: BorderRadius.circular(8.0), //圆⻆半径为8
            // child: Image.asset(data.appIcon, width: 60, height: 60),
            child: FlutterLogo(size: 60,),
          )
          .padding(all: 10)
          ,
          Expanded( //Expanded控件，用来拉伸中间区域
            child: Column( //Column控件，用来垂直摆放子Widget
              mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对⻬
              crossAxisAlignment: CrossAxisAlignment.start, //水平方向居左对⻬
              children: <Widget>[
                Text(widget.data.appName, maxLines: 1, overflow: TextOverflow.ellipsis), //App名字
                Text(widget.data.appDate, maxLines: 1), //App更新日期
              ],
            )
            // .backgroundColor(Colors.greenAccent)
            ,
          )
          ,
          ElevatedButton(
            onPressed: () => ddlog('Make a Note'),
            child: Row(
              children: [
                Text("更新"),
                // SizedBox(width: 5),
                // Icon(Icons.send),
              ],
            ),
          )
              .padding(right: 10)
          ,
        ]
    );
  }


  Widget buildBottomRow(BuildContext context) {
    return Padding( //Padding控件用来设置整体边距
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0), //左边距和右边距为15
        child: Column( //Column控件用来垂直摆放子Widget
            crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对⻬
            children: <Widget>[
              Container(
                child: Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                        children: <Widget>[
                          Text(widget.data.appDescription ?? "", maxLines: isShowAll ? null : 2,)
                              // .padding(right: 20)
                              .width(MediaQuery.of(context).size.width - 30)
                          ,
                          InkWell(
                              child: Text(isShowAll ? '收起' : "展开",
                                style: TextStyle(color: Theme.of(context).accentColor),
                              )
                                  // .backgroundColor(Colors.white60)
                            ,
                              onTap: _changeState,
                            ).positioned(right: 0, bottom: 0),
                        ],
                      );
                    }
                ),
              ),
              Text("${widget.data.appVersion} • ${widget.data.appSize} MB")
              .positioned(top: 10, bottom: 5),
            ]
        )
      // .backgroundColor(Colors.greenAccent)
    );
  }

  Widget buildBottomRowNew(BuildContext context) {
    return Column( //Column控件用来垂直摆放子Widget
        crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对⻬
        children: <Widget>[
          Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Text(widget.data.appDescription ?? "", maxLines: isShowAll ? null : 2,)
                  .padding(right: 15)
                  .width(MediaQuery.of(context).size.width - 30)
              ,
              InkWell(
                child: Text(isShowAll ? '收起' : "展开",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onTap: _changeState,
              )
                  .positioned(right: 0, bottom: 0)
              ,
            ],
          ),
          Text("${widget.data.appVersion} • ${widget.data.appSize} MB")
              .padding(top: 10, bottom: 5)
          ,
        ]
    ).padding(left: 15, right: 15);
  }

}


class NNListUpdateAppNewWidget extends StatelessWidget {

  final List<AppUpdateItemModel> list;

  const NNListUpdateAppNewWidget({
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
        return UpdateAppNewCard(data: data);
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
