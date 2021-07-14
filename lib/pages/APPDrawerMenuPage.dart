

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:get/get.dart';

class APPDrawerMenuPage extends StatefulWidget {

  final String? title;

  APPDrawerMenuPage({ Key? key, this.title}) : super(key: key);


  @override
  _APPDrawerMenuPageState createState() => _APPDrawerMenuPageState();
}

class _APPDrawerMenuPageState extends State<APPDrawerMenuPage> {


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
    return buildDrawerMenu(context);
  }
  
  Drawer buildDrawerMenu(BuildContext context) {
    return
      Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero, //去掉顶部灰色部分
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                    child: UnconstrainedBox( //解除父级的大小限制
                      child: CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/avatar.png')
                      ),
                    ),
                  ),
                  Text('设置在主页面,否则底部按钮无法挡住!', style: TextStyle(fontSize: 12.0, color: Colors.lightBlue), textAlign: TextAlign.center,),
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.blue),
                    title: Text("我的",style: TextStyle(fontSize: 16.0)),
                    trailing: Icon(Icons.chevron_right),
                    dense: true,
                    // horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    onTap: (){
                      Navigator.pop(context);
                      setState(() {
                        ddlog("我的");
                      });
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.volume_up,color: Colors.blue),
                    title: Text("消息",style: TextStyle(fontSize: 16.0)),
                    trailing: Icon(Icons.chevron_right),
                    dense: true,
                    // horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    onTap: (){
                      Navigator.pop(context);
                      Get.toNamed('notice');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings,color: Colors.blue),
                    title: Text("设置",style: TextStyle(fontSize: 16.0)),
                    trailing: Icon(Icons.chevron_right),
                    dense: true,
                    // horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    onTap: (){
                      Navigator.pop(context);
                      Get.toNamed('setting');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.share,color: Colors.blue),
                    title: Text("分享",style: TextStyle(fontSize: 16.0)),
                    trailing: Icon(Icons.chevron_right),
                    dense: true,
                    // horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    onTap: (){
                      ddlog("分享");
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.open_in_new,color: Colors.blue),
                    title: Text("退出",style: TextStyle(fontSize: 16.0)),
                    trailing: Icon(Icons.chevron_right),
                    dense: true,
                    // horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    onTap: (){
                      ddlog("退出");
                    },
                  ),
                ],
              ),

              TextButton(onPressed: (){
                Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
              }, child: Text("主题切换")),
            ],
          ),
        ),
      );
  }
}