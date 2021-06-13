//
//	ListTileDemoPage.dart.swift
//	MacTemplet
//
//	Created by Bin Shang on 2021/06/11 14:58
//	Copyright © 2021 Bin Shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';

class ListTileDemoPage extends StatefulWidget {

  final String? title;

  ListTileDemoPage({ Key? key, this.title}) : super(key: key);


  @override
  _ListTileDemoPageState createState() => _ListTileDemoPageState();
}

class _ListTileDemoPageState extends State<ListTileDemoPage> {

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        body: buildBody(context),
    );
  }


  Widget buildBody(BuildContext context) {
    return Material(
      child: Container(
        // color: Colors.green,
        // height: 500,
          child: Column(
            children: [
              ListTile(
                title: Text("ListTile"),
                subtitle: Text("subtitle"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  DDLog("ListTile");
                },
              ),
              CheckboxListTile(
                  title: Text("CheckboxListTile"),
                  subtitle: Text("subtitle"),
                  value: _value,
                  onChanged: (value){
                    DDLog(["CheckboxListTile", value]);
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _value = value;
                    });
                  }),
              SwitchListTile(
                  title: Text("SwitchListTile"),
                  subtitle: Text("subtitle"),
                  value: _value,
                  onChanged: (value){
                    DDLog(["SwitchListTile", value]);
                    setState(() {
                      _value = value;
                    });
                  }),
              RadioListTile(
                  title: Text("RadioListTile"),
                  subtitle: Text("subtitle"),
                  groupValue: _value,
                  value: _value,
                  controlAffinity: ListTileControlAffinity.trailing,
                  toggleable: true,
                  onChanged: (value){
                    DDLog(["RadioListTile", value]);
                    if (value == null) {
                      return;
                    }

                  }),
            ],
          )
      ),
    );
  }
}