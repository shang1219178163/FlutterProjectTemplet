//
//  AppAppSettingsPage.dart
//  fluttertemplet
//
//  Created by shang on 5/20/21 4:54 PM.
//  Copyright © 5/20/21 shang. All rights reserved.
//


// 设置
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/Widget_extension.dart';


class AppSettingsPage extends StatefulWidget{
  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage>{

  final titles = [
    '',
    '用户名', '真实姓名', '手机号', '微信号', 'QQ号', '银行卡', '会员等级',
    '',
    '服务器线路', '版本更新', '清楚缓存', '上次登录时间',
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),//修改返回按钮颜色
          centerTitle: true,
          title: Text('设置',style: TextStyle(color: Colors.white)),
          actions: [
            _buildDropdownButton()
          ],
        ),
        body: Container(
          color: Colors.black.withAlpha(10),
          child: Center(
            child: ListView(
                children:
                titles.map((e) {
                  return _settingCell(e);
                }).toList()
            ),
          ),
        )

    );
  }

  // Widget _containerCell(String title){
  //     return Container(
  //         padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
  //         child: Text(title, style: TextStyle(color: Color(0xff666666), fontSize: 15, fontWeight: FontWeight.w600)),
  //         decoration: BoxDecoration(
  //             border: Border(
  //                 top: BorderSide(width: 10,color: Color(0xfff2f2f2)),
  //                 bottom: BorderSide(width: 10,color: Color(0xfff2f2f2))
  //             )
  //         ),
  //     );
  // }

  Widget _settingCell(String title){
    if (title.isEmpty) {
      return Container(
        height: 10,
        child: Text(title),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(10),
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: ListTile(
        // contentPadding: EdgeInsets.only(left: 15,right: 15),
        title: Text(title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: (){ print(title); }, )
          .addBottomSeparator(height: 1, color: Colors.black.withAlpha(10)),
    );
  }


  final items = [
    DropdownMenuItem(child: Text('语文'), value: 0,),
    DropdownMenuItem(child: Text('数学'),value: 1),
    DropdownMenuItem(child: Text('英语'),value: 2),
  ];

  Object? _dropValue = 0;

  _buildDropdownButton() {
    return DropdownButton(
      hint: Text('请选择'),
      value: _dropValue,
      items: items,
      onChanged: (value){
        setState(() {
          _dropValue = value;
        });
        },
    );
  }
}
