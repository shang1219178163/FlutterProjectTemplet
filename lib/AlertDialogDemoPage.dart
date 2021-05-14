import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

import 'AlertSheetDemoPage.dart';
import 'BasicWidget/CheckBoxChooseWidget.dart';
import 'BasicWidget/CheckListChooseWidget.dart';
import 'BasicWidget/RadioBoxChooseWidget.dart';
import 'BasicWidget/RadioListChooseWidget.dart';
import 'DartExpand/AlertDialog_extension.dart';



class AlertDialogDemoPage extends StatefulWidget {

  @override
  _AlertDialogDemoPageState createState() => _AlertDialogDemoPageState();
}

class _AlertDialogDemoPageState extends State<AlertDialogDemoPage> {

  var itemSize = Size(70, 70);

  var titles = ["iOS默认风格", "安卓风格", "进度条",
                "进度环", "流水布局", "单选列表",
                "多选列表", "单选菜单", "多选菜单",
                "性别选择",];

  final title = "新版本 v${2.1}";
  final message = """
        1、支持立体声蓝牙耳机，同时改善配对性能;
        2、提供屏幕虚拟键盘;
        3、更简洁更流畅，使用起来更快;
        4、修复一些软件在使用时自动退出bug;
        5、新增加了分类查看功能;
          """;

  Object? sex = 1;

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
        body: Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0), spacing: 5, flowHeight: 300),
          children: titles.map((e) => OutlinedButton(onPressed: (){
            // DDLog(e);
            _onPressed(titles.indexOf(e));

          }, child: Text(e))).toList(),
        ));
  }

  void _onPressed(int e) {
    switch (e) {
      case 1:
        showAlertDialog();
        break;

      case 2:
        {
          CupertinoAlertDialog(
            title: Text(title),
            content: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ).padding(top: 15),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 3:
        {
          CupertinoAlertDialog(
            title: Text(title),
            content: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .7,
            ).padding(top: 15),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 4:
        {
          CupertinoAlertDialog(
            title: Text(title),
            content: buildWrap(context),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 5:
        {
          final list = [
            RadioListTileModel(title: Text("微信支付"), subtitle: Text("微信支付，不止支付"), secondary: Icon(Icons.camera), selected: true),
            RadioListTileModel(title: Text("阿里支付"), subtitle: Text("支付就用支付宝"), secondary: Icon(Icons.palette), selected: true),
            RadioListTileModel(title: Text("银联支付"), subtitle: Text("不打开APP就支付"), secondary: Icon(Icons.payment), selected: true),
          ];

          CupertinoAlertDialog(
            title: Text("支付方式 RadioListChooseWidget"),
            content: RadioListChooseWidget(models: list, index: 1, callback: (Object index) { DDLog(index); },),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 6:
        {
          final list = [
            RadioListTileModel(title: Text("微信支付"), subtitle: Text("微信支付，不止支付"), secondary: Icon(Icons.camera), selected: true),
            RadioListTileModel(title: Text("阿里支付"), subtitle: Text("支付就用支付宝"), secondary: Icon(Icons.palette), selected: true),
            RadioListTileModel(title: Text("银联支付"), subtitle: Text("不打开APP就支付"), secondary: Icon(Icons.payment), selected: true),
          ];

          CupertinoAlertDialog(
            title: Text("支付方式 CheckListChooseWidget"),
            content: CheckListChooseWidget(models: list, indexs: Set.from([0]), callback: (Set<int> indexs) { DDLog(indexs); },),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 7:
        {
          CupertinoAlertDialog(
            title: Text("单选  RadioBoxChooseWidget"),
            content: RadioBoxChooseWidget(titles: titles, index: 0, callback: (int index) { DDLog(index); },),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 8:
        {
          CupertinoAlertDialog(
            title: Text("多选 CheckBoxChooseWidget"),
            content: CheckBoxChooseWidget(titles: titles, indexs: Set.from([0]), callback: (Set<int> indexs) { DDLog(indexs); },),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;

      case 9:
        {
          CupertinoAlertDialog(
            title: Text("性别"),
            content: RadioTileSexWidget(selectedIndex: 0,),
            actions: ["确定", ].map((e) => TextButton(onPressed: (){
              // if (["Cancel", "取消"].contains(e)) {
              //   Navigator.pop(context);
              // }
              DDLog(e);

              Navigator.pop(context);
            }, child: Text(e),)).toList()
            ,
          )
              .show(context);
        }
        break;
      default:
        showCupertinoAlertDialog();
        break;
    }


    Icon(Icons.zoom_out_outlined);
  }

  void showCupertinoAlertDialog(){
    CupertinoAlertDialog(
      title: Text(title),
      content: Text(message).textAlignment(TextAlign.start),
      actions: ["取消", "确定"].map((e) => TextButton(onPressed: (){
        DDLog(e);
        Navigator.pop(context);
      }, child: Text(e),)).toList()
      ,
    )
        .show(context)
    ;
  }

  void showAlertDialog(){
      AlertDialog(
        title: Text(title),
        content: Text(message).textAlignment(TextAlign.start),
        actions: ["取消", "确定"].map((e) => TextButton(onPressed: (){
          // if (["Cancel", "取消"].contains(e)) {
          //   Navigator.pop(context);
          // }
          DDLog(e);
          Navigator.pop(context);
        }, child: Text(e),)).toList()
        ,
      )
          .show(context)
      ;
  }


  Wrap buildWrap(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: -8.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: titles.map((e) => TextButton.icon(onPressed: (){
        DDLog(titles.indexOf(e));
      // }, icon: Icon(Icons.check_circle_outline), label: Text("Button"))).toList(),
      }, icon: Icon(Icons.radio_button_unchecked_outlined),
        label: Text(e),
        style: OutlinedButton.styleFrom(
          primary: Colors.black87,
          side: BorderSide(width: 1, color: Colors.transparent),
        ),

      )).toList(),
    );
  }

}


class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  double spacing = 8.0;
  double flowHeight = double.infinity;

  TestFlowDelegate({required this.margin, required this.spacing, required this.flowHeight});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: Matrix4.translationValues(x, y, 0.0)
        );
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + spacing;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: Matrix4.translationValues(x, y, 0.0)
        );
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    // return Size(double.infinity, 250.0);
    return Size(double.infinity, flowHeight);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}