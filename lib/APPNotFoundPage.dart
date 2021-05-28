//
//  APPNotFoundPage.dart
//  fluttertemplet
//
//  Created by shang on 5/20/21 5:31 PM.
//  Copyright © 5/20/21 shang. All rights reserved.
//



import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';

class APPNotFoundPage extends StatelessWidget {

  final String? title;

  const APPNotFoundPage({
  	Key? key,
  	this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),

      body: Column(
        children: <Widget>[
          Hero(
            tag: 'avatar',
            child: Image.asset('assets/images/avatar.png', width:90),
          ),
          SizedBox(height: 10),
          Text('哎呀, 你的页面跑路了!', style: TextStyle(fontSize: 17.0, color: Colors.black)),
          TextButton(
            child: Text('立即捉它回家!', style: TextStyle(fontSize: 17.0)),
            onPressed: (){
              DDLog('哎呀, 你的页面跑路了!');
            },
          ),
        ],
      ).center().padding(top: 100),
    );
  }
}