import 'package:flutter/material.dart';
// import 'package:fluttertemplet/navigator_extension.dart';
import 'package:styled_widget/styled_widget.dart';
import 'DartExpand/DDLog.dart';
import 'DartExpand/Navigator_extension.dart';
import 'DartExpand/PopupMenuButton_extension.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  final String? title;

  SecondPage({ Key? key, this.title}) : super(key: key);


  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

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
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // leading: BackButton(
            //           color: Colors.white,
            //           onPressed: (){ NavigatorExt.popPage(context); }
            //           ),
            // // .gestures(onTap: ()=> DDLog("back")
            title: Text("$this"),
            actions: [
              PopupMenuButtonExt.fromEntryFromJson(
                  json: {"aa": "0",
                    "bb": "1",
                    "cc": "2"},
                  checkedString: "aa",
                  callback: (value) {
                    setState(() => DDLog(value));
                  }),

              PopupMenuButtonExt.fromCheckList(
                  list: ["a", "b", "c"],
                  checkedIdx: 1,
                  callback: (value) {
                    setState(() => DDLog(value));
                  }),
            ],
          ),
          body: Center(
            child: buildListView(context),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => DDLog('floatingActionButton'),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  buildListView(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyText1,
            ).padding(left: 15, right: 15),

            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              // onPressed: () => DDLog('pressed'),
              onPressed: () => {
                // test();
              },
            ),

            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () => DDLog('pressed'),
            ),

            TextButton(
              onPressed: () => DDLog('$this'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('呼叫', style: TextStyle(color: Theme.of(context).accentColor))
                      .padding(right: 5),
                  // SizedBox(width: 30),
                  Icon(Icons.call),
                ],
              )
                  .decorated(color: Colors.yellow, borderRadius: BorderRadius.all(Radius.circular(0))),
            )
                .decorated(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(5))),

            TextButton(
              onPressed: () => DDLog('Make a Note'),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Make a Note"),
                  SizedBox(width: 5),
                  Icon(Icons.send),
                ],
              ),
            ).decorated(color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 1.0, color: Colors.red)),

            // WidgetExt.buildBtn("菜单", Icon(Icons.send), ImageAlignment.right),
            TextButtonExt.build(
                text: Text("个人信息"),
                image: Icon(Icons.person),
                imageAlignment: ImageAlignment.right,
                callback: (value) {
                  DDLog(value.data);
                }),

            TextButtonExt.build(
                text: Text("菜单left"),
                image: Icon(Icons.info),
                imageAlignment: ImageAlignment.left,
                callback: (value) {
                  DDLog(value.data);
                })
                .decorated(color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1.0, color: Colors.red),),

            TextButtonExt.build(
                text: Text("菜单right"),
                image: Icon(Icons.info),
                imageAlignment: ImageAlignment.right,
                callback: (value) {
                  DDLog(value.data);

                }).decorated(color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 1.0, color: Colors.red)),

            TextButtonExt.build(
                text: Text("菜单top"),
                image: Icon(Icons.info),
                imageAlignment: ImageAlignment.top,
                callback: (value) {
                  DDLog(value.data);

                }).decorated(color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1.0, color: Colors.red),),

            TextButtonExt.build(
                text: Text("菜单bottom"),
                image: Icon(Icons.info),
                imageAlignment: ImageAlignment.bottom,
                callback: (value) {
                  DDLog(value.data);

                }).decorated(color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1.0, color: Colors.red),),

            IconButton(
              tooltip: '这是一个图标按钮',
              icon: Icon(Icons.person), iconSize: 30,
              color: Colors.red,
              onPressed: () {
                DDLog("这是一个图标按钮");
              },
            ),
            buildToggleButtons(context),
          ],
        ),
      ],
    );
  }


  buildToggleButtons(BuildContext context) {
    List<bool> _selecteds = [false, false, true];
    return
    ToggleButtons(
      isSelected: _selecteds,
      children: <Widget>[
        Icon(Icons.local_cafe),
        Icon(Icons.fastfood),
        Icon(Icons.cake),
      ],
      onPressed: (index) {
        _selecteds[index] = !_selecteds[index];
        DDLog(_selecteds);
        // setState(() {
        //   _selecteds[index] = !_selecteds[index];
        // });
       },
    );
  }

  test() {
    var _emap = Map<String, List<String>>();
    // _emap["a"] ??= <String>[],
    _emap["a"] ??= ["1", "2", "3"];

    var list = _emap["a"];
    list!.remove("1");
    // DDLog(list);
    // DDLog(_emap);

    DDLog([list, _emap]);
  }
}