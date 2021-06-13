//
//  AnimatedIconDemoPage.dart
//  fluttertemplet
//
//  Created by shang on 6/2/21 6:06 PM.
//  Copyright © 6/2/21 shang. All rights reserved.
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedIconDemoPage extends StatefulWidget {

  final String? title;

  AnimatedIconDemoPage({ Key? key, this.title}) : super(key: key);

  
  @override
  _AnimatedIconDemoPageState createState() => _AnimatedIconDemoPageState();
}

class _AnimatedIconDemoPageState extends State<AnimatedIconDemoPage> with TickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "$widget"),
        ),
        body: _buildPausePlayIcon(),
    );
  }

  Widget _buildPausePlayIcon() {
    return Center(
      child: InkWell(
        child: AnimatedIcon(
          icon: AnimatedIcons.pause_play,
          progress: _controller,
          size: 35,
        ),
        onTap: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      ),
    );
  }
}
