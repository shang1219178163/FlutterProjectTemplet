import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'FirstPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';
import 'FourthPage.dart';
import 'BatterLevelPage.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back)
                    // .gestures(onTap: ()=> DDLog("back")
                      .gestures(onTap: (){ Navigator.pop(context); }),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              FirstPage(title: '',).center(),
              SecondPage().center(),
              ThirdPage().center(),
              FourthPage().center(),
              BatterLevelPage(title: 'Batter Level Page').center(),
              // Center(child: SecondPage()),
              // Center(child: ThirdPage()),
              // Center(child: FourthPage()),

              // Icon(Icons.home),
              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}