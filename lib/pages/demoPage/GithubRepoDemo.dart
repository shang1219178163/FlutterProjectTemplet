//
//  GithubRepoDemo.dart
//  fluttertemplet
//
//  Created by shang on 7/26/21 5:56 PM.
//  Copyright © 7/26/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:fluttertemplet/network/httpManager.dart';

class GithubRepoDemo extends StatefulWidget {

  final String? title;

  GithubRepoDemo({ Key? key, this.title}) : super(key: key);


  @override
  _GithubRepoDemoState createState() => _GithubRepoDemoState();
}

class _GithubRepoDemoState extends State<GithubRepoDemo> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$widget"),
        actions: [
          IconButton(onPressed: (){
            setState(() { });
          }, icon: Icon(Icons.refresh)),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            // future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            future: HttpManager.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                //发生错误
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                //请求成功，通过项目信息构建用于显示项目名称的ListView
                return ListView(
                  children: response.data.map<Widget>((e) =>
                      ListTile(title: Text(e["full_name"]))
                  ).toList(),
                );
              }
              //请求未完成时弹出loading
              return CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}
