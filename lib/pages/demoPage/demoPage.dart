//
//  demoPage.dart
//  fluttertemplet
//
//  Created by shang on 5/14/21 8:08 PM.
//  Copyright © 5/14/21 shang. All rights reserved.
//

//
//  demoPage.dart
//  fluttertemplet
//
//  Created by shang on 5/14/21 8:17 PM.
//  Copyright © 5/14/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class demoPage extends StatefulWidget {

  final String? title;

  demoPage({ Key? key, this.title}) : super(key: key);


  @override
  _demoPageState createState() => _demoPageState();
}

class _demoPageState extends State<demoPage> {


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
    dynamic arguments = ModalRoute
        .of(context)!
        .settings
        .arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments[1]),
        ),
        body: Text(arguments.toString())
    );
  }



  void func(BuildContext context) {

  }



}

