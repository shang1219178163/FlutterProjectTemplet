//
//  AnimatedDemoPage.dart
//  fluttertemplet
//
//  Created by shang on 6/22/21 5:44 PM.
//  Copyright © 6/22/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:styled_widget/styled_widget.dart';


class AnimatedDemoPage extends StatefulWidget {

  final String? title;

  AnimatedDemoPage({ Key? key, this.title}) : super(key: key);


  @override
  _AnimatedDemoPageState createState() => _AnimatedDemoPageState();
}

class _AnimatedDemoPageState extends State<AnimatedDemoPage> with TickerProviderStateMixin{

  late AnimationController _controller = AnimationController(duration: const Duration(milliseconds: 350), vsync: this);

  double size = 100;

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

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "$widget"),
        ),
        body: _buildPageView(context),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      onPageChanged: (index){
        print('当前为第$index页');
      },
      children: <Widget>[
        _buildPausePlayIcon(),
        _buildAnimatedSizeIcon(context),
        _buildAnimatedCrossFadeIcon(),
        _buildAnimatedSwitcher(context),
        Container(
          child: Text('第0页')
              .center()
          ,
        )
            .decorated(color: Colors.red)
        ,
        Container(
          child: Text('第1页')
              .center()
          ,
        )
            .decorated(color: Colors.yellow)
        ,
        Container(
          child: Text('第2页')
              .center()
          ,
        )
            .decorated(color: Theme.of(context).primaryColor)
        ,
      ],
    );
  }

  ///播放按钮组件
  Widget _buildPausePlayIcon() {
    return Center(
      child: InkWell(
        child: AnimatedIcon(
          icon: AnimatedIcons.pause_play,
          progress: _controller,
          size: 35,
        ),
        onTap: () {
          ddlog("AnimatedIcon");
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      ),
    );
  }


  ///缩放组件
  Widget _buildAnimatedSizeIcon(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ddlog("AnimatedSize");
        setState(() {
          size = size == 100 ? 200 : 100;
        });
      },
      child: Center(
        child: Container(
          color: Colors.green,
          child: AnimatedSize(
            duration: Duration(milliseconds: 350),
            vsync: this,
            child: FlutterLogo(size: size,),
          ),
        ),
      ),
    );
  }

  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  ///播放按钮组件
  Widget _buildAnimatedCrossFadeIcon() {
    return Center(
      child: InkWell(
        child: AnimatedCrossFade(
          crossFadeState: _crossFadeState,
          duration: const Duration(seconds: 2),
          firstChild: const Icon(Icons.text_rotate_up, size: 150, color: Colors.green,),
          secondChild: const Icon(Icons.text_rotate_vertical, size: 150),
        ),
        onTap: () {
          ddlog("AnimatedCrossFade");

          setState(() {
            _crossFadeState = _crossFadeState == CrossFadeState.showFirst ?  CrossFadeState.showSecond : CrossFadeState.showFirst;

          });

        },
      ),
    );
  }


  int _count = 0;

  Widget _buildAnimatedSwitcher(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          OutlinedButton(
            child: const Text('+1',),
            onPressed: () {
              ddlog("AnimatedSwitcher");

              setState(() {
                _count += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}