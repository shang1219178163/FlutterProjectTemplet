//
//	StepperDemoPage.dart
//	MacTemplet
//
//	Created by Bin Shang on 2021/06/11 17:15
//	Copyright © 2021 Bin Shang. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';
import 'package:fluttertemplet/dartExpand/Widget_extension.dart';


///步骤一二三
class StepperDemoPage extends StatefulWidget {
  StepperDemoPage({Key? key}) : super(key: key);

  @override
  _StepperDemoPageState createState() => _StepperDemoPageState();
}


class _StepperDemoPageState extends State<StepperDemoPage> {
  StepperType _type = StepperType.vertical;

  List titles = List.generate(3, (index) => "Step $index");

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$widget"),
          actions: [
            TextButton(onPressed: (){
              DDLog("change");
              setState(() {
                if (_type == StepperType.vertical) {
                  _type = StepperType.horizontal;
                } else {
                  _type = StepperType.vertical;
                }
              });
            }, child: Icon(Icons.change_circle_outlined, color: Colors.white,)),
          ],
        ),
        body: buildStepper(context),
      // body: buildStepperSystem(context),
    );

  }

  void go(int index) {
    if (index == -1 && _index <= 0 ) {
      DDLog("已经是第一个 Step了,无法再后退了");
      return;
    }

    if (index == 1 && _index >= titles.length - 1) {
      DDLog("已经是最后一个 Step了,无法再前进了");
      return;
    }

    setState(() {
      _index += index;
    });
  }

  Widget buildStepper(BuildContext context) {
    return Stepper(
      type: _type,
      currentStep: _index,
      physics: ClampingScrollPhysics(),
      steps: titles.map((e) => Step(
        isActive: _index == titles.indexOf(e),
        isStepperTypeHorizontalBottom: true,
        isStepperTypeHorizontalBottomLineFollowIconMidY: true,
        title: Text(e,),
        subtitle: Text("subtitle${titles.indexOf(e)}",),
        content: Container(
            height: 300,
            color: ColorExt.random(),
            // alignment: Alignment.centerLeft,
            child: Text("Content for Step ${titles.indexOf(e)}")
        ),
      )).toList(),
      onStepCancel: () {
        go(-1);
      },
      onStepContinue: () {
        go(1);
      },
      onStepTapped: (index) {
        DDLog(index);
        setState(() {
          _index = index;
        });
      },
      controlsBuilder: (BuildContext context, { VoidCallback? onStepContinue, VoidCallback? onStepCancel }){
        return Row(
          children: [
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: onStepContinue,
              child: Text("Next"),
            ),
            SizedBox(width: 8,),
            TextButton(onPressed: onStepCancel, child: Text("Back"), ),

          ],
        );
      }
    );
  }

  Widget buildRow(String title) {
    return Row(
      children: <Widget>[
        Container(
          height: 72.0,
          child: Center(
            child: Icon(Icons.security),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 12.0),
          child: Text(title),
        ),
      ],
    );
  }

}
