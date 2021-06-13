import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';
import 'package:get/get.dart';

import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';

import 'package:fluttertemplet/basicWidget/MultipleChioceListWidget.dart';
import 'package:fluttertemplet/basicWidget/MultipleChioceWrapWidget.dart';
import 'package:fluttertemplet/basicWidget/SingleChoiceListWidget.dart';
import 'package:fluttertemplet/DartExpand/ActionSheet_extension.dart';
import 'package:fluttertemplet/DartExpand/Widget_extension.dart';
import 'ShowSearchDemoPage.dart';


class AlertSheetDemoPage extends StatefulWidget {

  @override
  _AlertSheetDemoPageState createState() => _AlertSheetDemoPageState();
}

class _AlertSheetDemoPageState extends State<AlertSheetDemoPage> {

  var titles = ["默认样式", "ListTile", "添加子视图", "自定义", "单选列表", "多选列表", "6", "7", "8"];

  final title = "新版本 v${2.1}";
  final message = """
1、支持立体声蓝牙耳机，同时改善配对性能;
2、提供屏幕虚拟键盘;
3、更简洁更流畅，使用起来更快;
4、修复一些软件在使用时自动退出bug;
""";


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
          title: Text("$widget"),
        ),
        body: buildWrap(context).padding(all: 10)
    );
  }

  Wrap buildWrap(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: -8.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
        children: titles.map((e) => ActionChip(
          avatar: CircleAvatar(backgroundColor: Colors.blue,
              child: Text("${e.characters.first.toUpperCase()}")
          ),
          label: Text(e),
          onPressed: (){
            _onPressed(titles.indexOf(e));
          },
        )).toList(),
    );
  }

  void _onPressed(int e) {
    switch (e) {
      case 1:
          showAlertSheetListTile();
        break;

      case 2:
        {
        }
        break;

      case 3:
        {
          ActionSheetExt.showModalSheet(context: context,
              title: title,
              message: message,
              actionTitles: titles,
              callback: (value){
                DDLog(value);
              }
          );
        }
        break;

      case 4:
        {
          showModalPopupRadioListChoose();

        }
        break;

      case 5:
        {
          final list = [
            ChioceModel(title: Text("微信支付"), subtitle: Text("微信支付，不止支付"), secondary: Icon(Icons.camera), selected: true),
            ChioceModel(title: Text("阿里支付"), subtitle: Text("支付就用支付宝"), secondary: Icon(Icons.palette), selected: true),
            ChioceModel(title: Text("银联支付"), subtitle: Text("不打开APP就支付"), secondary: Icon(Icons.payment), selected: true),
          ];

          CupertinoActionSheet(
            title: Text(title),
            message: Text(message),
            actions: [
              MultipleChioceListWidget(items: list, indexs: Set.from([0]), canScroll: false, containerColor: Colors.black.withAlpha(10), callback: (Set<int> indexs) { DDLog(indexs); },),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
              .toShowCupertinoModalPopup(context: context)
          ;

      }
        break;

      case 6:
        {
          // List<String> list = List.generate(100, (i) => 'item $i');
          // showSearch(context: context, delegate: CustomSearchDelegate(list: list, select: ""));
          Get.toNamed(APPRouter.showSearchDemoPage, arguments: []);
        }
        break;

      case 7:
        {
          // showSearch(context: context, delegate: SearchBarViewDelegate());

        }
        break;

      case 8:
        {

        }
        break;

      default:
          showAlertSheet();
        break;
    }
    // DDLog(e);
  }

  void showAlertSheet() {
    CupertinoActionSheet(
      title: Text(title),
      message: Text(message),
      actions: ["选择 1", "选择 2", "选择 3",].map((e) => CupertinoActionSheetAction(
        child: Text(e),
        onPressed: () {
          DDLog(e);
          Navigator.pop(context);
        },
      ),).toList(),
      cancelButton: CupertinoActionSheetAction(
        child: Text('取消'),
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    )
        .toShowCupertinoModalPopup(context: context)

    ;
  }

  void showAlertSheetListTile() {
      final actions = [
        ListTile(
          leading: Icon(Icons.add),
          title: Text('Add account'),
          trailing: Icon(Icons.check),
          onTap: () {
            DDLog("account");
            Navigator.pop(context);

          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Manage accounts'),
          onTap: () {
            DDLog("accounts");
            Navigator.pop(context);

          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Your Profile",
          ),
          onTap: () {
            DDLog("Profile");
            Navigator.pop(context);
          },
        ),
      ];

      CupertinoActionSheet(
        title: Text(title),
        message: Text(message),
        actions: [
          actions
              .toColumn()
              .decorated(color: Colors.black.withAlpha(10))
              .toMaterial()
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
          .toShowCupertinoModalPopup(context: context)

      ;
    }

  void showModalPopupRadioListChoose(){
      final list = [
        ChioceModel(title: Text("微信支付"), subtitle: Text("微信支付，不止支付"), secondary: Icon(Icons.camera), selected: true),
        ChioceModel(title: Text("阿里支付"), subtitle: Text("支付就用支付宝"), secondary: Icon(Icons.palette), selected: true),
        ChioceModel(title: Text("银联支付"), subtitle: Text("不打开APP就支付"), secondary: Icon(Icons.payment), selected: true),
      ];

      CupertinoActionSheet(
        title: Text(title),
        message: Text(message),
        actions: [
          SingleChoiceListWidget(items: list, index: 1, callback: (Object index) { DDLog(index); }, canScroll: false,),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
          .toShowCupertinoModalPopup(context: context)
      ;
    }
}



///单选列表
class RadioListChooseNewWidget extends StatefulWidget {
  Object? selectedIndex = 0;

  @override
  _RadioListChooseNewWidgetState createState() => _RadioListChooseNewWidgetState();
}


class _RadioListChooseNewWidgetState extends State<RadioListChooseNewWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RadioListTile(
            value: 0,
            onChanged: (value) {
              _changeValue(value);
            },
            groupValue: widget.selectedIndex,
            title: Text("一级标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.camera),
            selected: widget.selectedIndex == 0,
          ),
          RadioListTile(
            value: 1,
            onChanged: (value) {
              _changeValue(value);
            },
            groupValue: widget.selectedIndex,
            title: Text("一级标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.palette),
            selected: widget.selectedIndex == 1,
          ),
        ],
      ),
    );
  }

  void _changeValue(Object? value){
    setState(() {
      widget.selectedIndex = value;
    });
  }
}


///单选菜单
class RadioTileSexWidget extends StatefulWidget {
  Object selectedIndex = 0;

  RadioTileSexWidget({
    required this.selectedIndex,
  });

  @override
  _RadioTileSexWidgetState createState() => _RadioTileSexWidgetState();
}


class _RadioTileSexWidgetState extends State<RadioTileSexWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: widget.selectedIndex,
                onChanged: (value) {
                  _changeValue(value);
                },
              ),
              Text("男"),
              SizedBox(width: 20),
              Radio(
                value: 1,
                groupValue: widget.selectedIndex,
                onChanged: (value) {
                  _changeValue(value);
                },
              ),
              Text("女"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("你选择的是${widget.selectedIndex == 1 ? "男" : "女"}")
            ],
          )
        ],
      ),
    );
  }

  void _changeValue(Object? value){
    if (value == null){
      return;
    }
    setState(() {
      widget.selectedIndex = value;
    });
    DDLog(widget.selectedIndex);
  }
}


