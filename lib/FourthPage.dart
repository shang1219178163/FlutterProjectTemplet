import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'DDLog.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back)
            // .gestures(onTap: ()=> DDLog("back", StackTrace.current)
                .gestures(onTap: (){ Navigator.pop(context); }),
            title: Text("$this"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '_counter',
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
                 .gestures(onTap: () => DDLog('RaisedButton pressed', StackTrace.current))

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => DDLog('floatingActionButton', StackTrace.current),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}