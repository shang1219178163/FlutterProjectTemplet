//
//  NumberStepper.dart
//  fluttertemplet
//
//  Created by shang on 6/13/21 6:23 AM.
//  Copyright © 6/13/21 shang. All rights reserved.
//




// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';

enum NumberStepperStyle {
system,
outlined,
}

///自定义数值增减 Stepper
class NumberStepper extends StatefulWidget {
  NumberStepper({
    required this.minValue,
    required this.maxValue,
    required this.stepValue,
    this.iconSize = 24,
    required this.value,
    this.color = Colors.blue,
    this.style = NumberStepperStyle.system,
    this.radius = 5.0,
    this.wraps = true,
    required this.block,
  });

  final int minValue;
  final int maxValue;
  final int stepValue;
  final double iconSize;
  int value;

  final bool wraps;

  final Color color;
  final NumberStepperStyle style;
  final double radius;
  void Function(int value) block;


  @override
  _NumberStepperState createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {

  @override
  Widget build(BuildContext context) {
    // return buildOther(context);
    switch (widget.style) {
      case NumberStepperStyle.outlined:
        return buildOutlinedStyle(context);
        break;
      default:
        break;
    }
    return buildSystemStyle(context);
  }

  Widget buildSystemStyle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.iconSize,
          height: widget.iconSize,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: widget.color, width: 1), // 边色与边宽度
          ),
          child: IconButton(
            icon: Icon(Icons.remove, size: widget.iconSize),
            // iconSize: widget.iconSize,
            padding: EdgeInsets.zero,
            color: Colors.white,
            onPressed: () {
              go(-widget.stepValue);
            },

          ),
        ),

        Container(
          width: widget.value.toString().length*18*widget.iconSize/30,
          // width: widget.iconSize + 20,
          child: Text('${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        Container(
          width: widget.iconSize,
          height: widget.iconSize,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: widget.color, width: 1), // 边色与边宽度
          ),
          child: IconButton(
            icon: Icon(Icons.add, size: widget.iconSize,),
            // iconSize: widget.iconSize,
            padding: EdgeInsets.zero,
            color: Colors.white,
            onPressed: () {
              setState(() {
                go(widget.stepValue);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildOutlinedStyle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.iconSize,
          height: widget.iconSize,
          // color: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: widget.color, width: 1), // 边色与边宽度
          ),
          child: IconButton(
            icon: Icon(Icons.remove, size: widget.iconSize),
            // iconSize: widget.iconSize,
            padding: EdgeInsets.zero,
            color: widget.color,
            onPressed: () {
              go(-widget.stepValue);
            },
          ),
        ),

        Container(
          width: widget.value.toString().length*18*widget.iconSize/30,
          // width: widget.iconSize + 20,
          child: Text('${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        Container(
          width: widget.iconSize,
          height: widget.iconSize,
          // color: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: widget.color, width: 1), // 边色与边宽度
          ),
          child: IconButton(
            icon: Icon(Icons.add, size: widget.iconSize),
            // iconSize: widget.iconSize,
            padding: EdgeInsets.zero,
            color: widget.color,
            onPressed: () {
              setState(() {
                go(widget.stepValue);
              });
            },
          ),
        ),
      ],
    );
  }

  void go(int stepValue) {
    setState(() {
      if (stepValue < 0 && (widget.value == widget.minValue || widget.value + stepValue < widget.minValue)) {
        DDLog("已经是最小值了");
        if (widget.wraps) widget.value = widget.maxValue;
        widget.block(widget.value);
        return;
      }
      if (stepValue > 0 && (widget.value == widget.maxValue || widget.value + stepValue > widget.maxValue)) {
        DDLog("已经是最大值了");
        if (widget.wraps) widget.value = widget.minValue;
        widget.block(widget.value);
        return;
      }
      widget.value += stepValue;
    });
    widget.block(widget.value);
  }
}