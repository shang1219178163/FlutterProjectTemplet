import 'package:flutter/material.dart';
import 'package:fluttertemplet/FirstPage.dart';
import 'package:fluttertemplet/textlessPage.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertemplet/DDLog.dart';

import 'package:fluttertemplet/TabBarDemo.dart';
import 'package:fluttertemplet/ListPageController.dart';

import 'FButtonPage.dart';
import 'PopupMenuButton_extension.dart';
import 'NNListWidgetPage.dart';

void main() {
  runApp(MyApp());
  // runApp(TabBarDemo());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your aptplication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Templet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,//设置明暗模式为暗色
        // accentColor: Colors.black,//(按钮）Widget前景色为黑色
        // primaryColor: Colors.cyan,//主色调为青色
        // iconTheme:IconThemeData(color: Colors.yellow),//设置icon主题色为黄色
        // textTheme: TextTheme(body1: TextStyle(color: Colors.red))//设置文本颜色为红色
    ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

        //导航条左边的组件
        leading: Icon(Icons.arrow_back)
                .opacity(0)
                .gestures(onTap: ()=> DDLog("back", StackTrace.current)),
        //导航条右边的一组组件
        actions: [
          // Icon(Icons.settings)
          //     .padding(right: 8)
          //     .gestures(onTap: ()=> DDLog("settings", StackTrace.current)),
          // Icon(Icons.search)
          //     // .padding(right: 8)
          //     .gestures(onTap: ()=> DDLog("search", StackTrace.current)),

          PopupMenuButtonExt.fromEntryFromJson(
              json: {"aa": "0",
                    "bb": "1",
                    "cc": "2"},
              checkedString: "aa",
              callback: (value) {
                setState(() => DDLog(value, StackTrace.current));
          }),

          PopupMenuButtonExt.fromCheckList(
              list: ["a", "b", "c"],
              checkedIdx: 1,
              callback: (value) {
                setState(() => DDLog(value, StackTrace.current));
          }),

          // PopupMenuButtonExt.from(
          //     list: ["aaa", "bbb", "ccc"],
          //     callback: (value) {
          //       setState(() => DDLog(value, StackTrace.current));
          //     }),
          // PopupMenuButtonExt.from(
          //     list: ["aaa", 'bbb', "ccc"],
          //     callback: (value) {
          //       setState(() => DDLog(value, StackTrace.current));
          //     }),
          // PopupMenuButtonExt.fromJson(
          //     json: {"aaaa": "0",
          //           "cccc": "2",
          //           "bbbb": "1",},
          //     callback:(value) {
          //       setState(() => DDLog(value, StackTrace.current));
          //     }),
          // PopupMenuButtonExt.fromJson(
          //     json: { "aaaa": "0",
          //         "cccc": "2",
          //         "bbbb": "1",},
          //     callback:(value) {
          //         setState(() => DDLog(value, StackTrace.current));
          //     }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), highlightColor: Colors.red, onPressed: ()=> DDLog("home", StackTrace.current),
            ),
            IconButton(icon: Icon(Icons.directions_car), onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return TabBarDemo();
                }));
              },
            ),
            // IconButton(icon: Icon(Icons.directions_transit), onPressed: ()=> DDLog("directions_transit", StackTrace.current),
            // ),
            IconButton(icon: Icon(Icons.directions_car), onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return TextlessPage(title: "TextlessPage");
                    // return FButtonPage();
                  }));
              },
            ),
            IconButton(icon: Icon(Icons.directions_bike), onPressed:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    // return ListWidgetPage();
                    return ListPageController();
                  }));
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Icon(Icons.beach_access, color: Colors.orange)
                .padding(all: 10)
                .decorated(color: Color(0xff7AC1E7), shape: BoxShape.circle)
                .padding(all: 15)
                .decorated(color: Color(0xffE8F2F7), shape: BoxShape.circle)
                .padding(all: 20)
                .card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
                .alignment(Alignment.center)
                .backgroundColor(Color(0xffEBECF1))
            // .gestures(onTap: () => print('${this}_${DateTime.now()} RaisedButton pressed'))
            // .gestures(onTap: () => logger.info('${this}_${DateTime.now()} RaisedButton pressed'))
            // .gestures(onTap: () => print('${DateTime.now()} RaisedButton pressed'))
            //  .gestures(onTap: () => DDLog('RaisedButton pressed', StackTrace.current))
                .gestures(onTap: () => test())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  test(){
    var a = 85.99999;
    var b = 488.236;
    var c = 488.3;
    
    DDLog(a.toStringAsExponential(2), StackTrace.current);
    DDLog(a.toStringAsFixed(2), StackTrace.current);
    DDLog(a.toStringAsPrecision(2), StackTrace.current);
    
    "1111".printNew();
  }
}
