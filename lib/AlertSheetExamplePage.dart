import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

import 'DartExpand/ActionSheet_extension.dart';


class AlertSheetExamplePage extends StatefulWidget {

  @override
  _AlertSheetExamplePageState createState() => _AlertSheetExamplePageState();
}

class _AlertSheetExamplePageState extends State<AlertSheetExamplePage> {

  var titles = ["默认样式", "ListTile", "添加子视图", "3", "4", "5", "6", "7", "8"];

  final title = "新版本 v${2.1}";
  final message = """
        1、支持立体声蓝牙耳机，同时改善配对性能;
        2、提供屏幕虚拟键盘;
        3、更简洁更流畅，使用起来更快;
        4、修复一些软件在使用时自动退出bug;
        5、新增加了分类查看功能;
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
          title: Text(arguments[1]),
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
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("${e.characters.first.toUpperCase()}")),
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
          showModalPopupContentWidget();
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
          showAlertSheet();
        break;
    }

  }

    // Wrap buildWrap(BuildContext context) {
  //   return Wrap(
  //     spacing: 8.0, // 主轴(水平)方向间距
  //     runSpacing: 0.0, // 纵轴（垂直）方向间距
  //     alignment: WrapAlignment.start, //沿主轴方向居中
  //     children: <Widget>[
  //       ActionChip(
  //         avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
  //         label: Text('Hamilton'),
  //         onPressed: (){
  //           DDLog('Hamilton');
  //         },
  //       ),
  //       ActionChip(
  //         avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
  //         label: Text('Lafayette'),
  //         onPressed: (){
  //           DDLog('Lafayette');
  //         },
  //       ),
  //       ActionChip(
  //         avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
  //         label: Text('Mulligan'),
  //         onPressed: (){
  //           DDLog('Mulligan');
  //         },
  //       ),
  //       ActionChip(
  //         avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
  //         label: Text('Laurens'),
  //         onPressed: (){
  //           DDLog('Laurens');
  //         },
  //       ),
  //     ],
  //   );
  // }


    void showAlertSheet() {

      CupertinoActionSheetExt.showModalPopup(
          context: context,
          title: title,
          message: message,
          actionTitles: ["选择 1", "选择 2", "选择 3",],
          callback: (value){
            DDLog(value);
          });
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
      ]
      //     .map((e) => CupertinoActionSheetAction(onPressed: () {
      //   Navigator.pop(context);
      // }, child: e,)).toList()
          ;
      CupertinoActionSheetExt.showModalPopupWidgets(
        context: context,
        title: title,
        message: message,
        actionWidgets: actions,
      );
    }


    void showModalPopupContentWidget(){
      CupertinoActionSheet(
        title: Text(title),
        message: RadioListChooseNewWidget(),
        cancelButton: CupertinoActionSheetAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ).show(context)
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


