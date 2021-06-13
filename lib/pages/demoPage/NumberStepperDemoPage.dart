//
//  NumberStepperDemoPage.dart
//  fluttertemplet
//
//  Created by shang on 6/13/21 6:26 AM.
//  Copyright © 6/13/21 shang. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:fluttertemplet/basicWidget/NumberStepper.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';

class NumberStepperDemoPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: kPrimaryColor,
        title: Text("Custom Stepper"),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                  // border: Border.all(color: Colors.blue, width: 1), // 边色与边宽度
                ),
                child: OutlinedButton(
                  style: ButtonStyle(
                    padding:  MaterialStateProperty.all(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all(Size(44, 44)),
                  ),
                  child: Icon(Icons.security, color: Colors.white,),
                  onPressed: () { DDLog("onPressed"); },
                ),
              ),
              Spacer(),
              NumberStepper(
                minValue: 1,
                maxValue: 1000,
                stepValue: 100,
                iconSize: 60,
                value: 1000,
                color: Colors.blue,
                style: NumberStepperStyle.system,
                block: (value){
                  DDLog(value);
                },
              ),

              SizedBox(height: 20,),
              NumberStepper(
                minValue: 1,
                maxValue: 1000,
                stepValue: 100,
                iconSize: 40,
                value: 1000,
                color: Colors.blue,
                style: NumberStepperStyle.outlined,
                block: (value){
                  DDLog(value);
                },
            ),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }


  Widget buildCard(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.red,
                  offset: Offset(0, 20),
                  blurRadius: 30.0),
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/avatar.png',fit: BoxFit.fitWidth,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0,left: 8.0),
              child: Text('Juicy Strawberry',style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0,left: 8.0),
              child: Row(
                children: [
                  Text('\$20.40',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  NumberStepper(
                    minValue: 1,
                    maxValue: 1000,
                    stepValue: 100,
                    iconSize: 30,
                    value: 1000,
                    color: Colors.red,
                    block: (value){
                      DDLog(value);
                    },
                  )
                ],
              ),
            ),

          ],
        ),
      ));
  }
}