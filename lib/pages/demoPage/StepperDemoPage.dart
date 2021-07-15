//
//	StepperDemoPage.dart
//	MacTemplet
//
//	Created by Bin Shang on 2021/06/11 17:15
//	Copyright © 2021 Bin Shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/dartExpand/Widget_extension.dart';
import 'package:tuple/tuple.dart';
import 'enhance_stepper.dart';

import 'package:fluttertemplet/dartExpand/ButtonExt.dart';

///步骤一二三
class StepperDemoPage extends StatefulWidget {
  StepperDemoPage({Key? key}) : super(key: key);

  @override
  _StepperDemoPageState createState() => _StepperDemoPageState();
}


class _StepperDemoPageState extends State<StepperDemoPage> {
  StepperType _type = StepperType.vertical;

  int groupValue = 0;

  List<Tuple2> tuples = [
    Tuple2(Icons.directions_bike, StepState.indexed, ),
    Tuple2(Icons.directions_bus, StepState.editing, ),
    Tuple2(Icons.directions_railway, StepState.complete, ),
    Tuple2(Icons.directions_boat, StepState.disabled, ),
    Tuple2(Icons.directions_car, StepState.error, ),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$widget"),
          actions: [
            TextButton(onPressed: (){
              ddlog("change");
              setState(() {
                _type = _type == StepperType.vertical ? StepperType.horizontal : StepperType.vertical;
              });
            }, child: Icon(Icons.change_circle_outlined, color: Colors.white,)),
          ],
          bottom: buildPreferredSize(context),
        ),
        // body: buildStepper(context),
        body: groupValue == 0 ? buildStepper(context) : buildStepperCustom(context),
      //   body: Theme(
      //     data: ThemeData(
      //     accentColor: Colors.orange,
      //     primarySwatch: Colors.orange,
      //     colorScheme: ColorScheme.light(
      //     primary: Colors.orange
      //     )
      //   ),
      //     child: buildStepperCustom(context),
      // ),
    );
  }

  PreferredSizeWidget buildPreferredSize(BuildContext context) {
    return
      PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 24),
                Expanded(
                  child: CupertinoSegmentedControl(
                    children: const <int, Widget>{
                      0: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Stepper', style: TextStyle(fontSize: 15))),
                      1: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('enhance_stepper', style: TextStyle(fontSize: 15))),
                    },
                    groupValue: groupValue,
                    onValueChanged: (value) {
                      // TODO: - fix it
                      ddlog(value.toString());
                      setState(() {
                        groupValue = int.parse("$value");
                      });
                    },
                    borderColor: Colors.white,
                    // selectedColor: Theme.of(context).primaryColor,
                    // unselectedcolor: Colors.white,
                  ),
                ),
                SizedBox(width: 24)
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 48));
  }

  void go(int index) {
    if (index == -1 && _index <= 0 ) {
      ddlog("it's first Step!");
      return;
    }

    if (index == 1 && _index >= tuples.length - 1) {
      ddlog("it's last Step!");
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
        steps: tuples.map((e) => Step(
          state: StepState.values[tuples.indexOf(e)],
          isActive: _index == tuples.indexOf(e),
          isStepperTypeHorizontalBottom: true,
          isStepperTypeHorizontalBottomLineFollowIconMidY: true,
          title: Text("step ${tuples.indexOf(e)}"),
          subtitle: Text("${e.item2.toString().split(".").last}",),
          content: Text("Content for Step ${tuples.indexOf(e)}"),
      )).toList(),
      onStepCancel: () {
        go(-1);
      },
      onStepContinue: () {
        go(1);
      },
      onStepTapped: (index) {
        ddlog(index);
        setState(() {
          _index = index;
        });
      },
      controlsBuilder: (BuildContext context, { VoidCallback? onStepContinue, VoidCallback? onStepCancel }){
        return Row(
          children: [
            SizedBox(height: 30,),
            if (_index != tuples.length - 1) ElevatedButton(
              onPressed: onStepContinue,
              child: Text("Continue"),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
            ),
            SizedBox(width: 8,),
            if (_index != 0)  ElevatedButton(
              onPressed: onStepCancel,
              child: Text("Cancel"),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
            ),
          ],
        );
      }
    );
  }

  Widget buildStepperCustom(BuildContext context) {
    return EnhanceStepper(
        stepIconSize: 30,
        type: _type,
        currentStep: _index,
        physics: ClampingScrollPhysics(),
        steps: tuples.map((e) => EnhanceStep(
          circleChild: Icon(e.item1, color: Theme.of(context).primaryColor, size: 30,),
          state: StepState.values[tuples.indexOf(e)],
          isActive: _index == tuples.indexOf(e),
          isStepperTypeHorizontalBottom: true,
          isStepperTypeHorizontalBottomLineFollowIconMidY: true,
          title: Text("step ${tuples.indexOf(e)}"),
          subtitle: Text("${e.item2.toString().split(".").last}",),
          content: Text("Content for Step ${tuples.indexOf(e)}"),
        )).toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          ddlog(index);
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
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
              ),
              SizedBox(width: 8,),
              TextButton(onPressed: onStepCancel,
                child: Text("Back"),
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
              ),
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
