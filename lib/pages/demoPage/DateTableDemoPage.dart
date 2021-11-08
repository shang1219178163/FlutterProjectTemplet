//
//  DateTableDemoPage.dart
//  fluttertemplet
//
//  Created by shang on 6/4/21 8:09 AM.
//  Copyright © 6/4/21 shang. All rights reserved.
//



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:tuple/tuple.dart';

class DateTableDemoPage extends StatefulWidget {

  final String? title;

  DateTableDemoPage({ Key? key, this.title}) : super(key: key);

  
  @override
  _DateTableDemoPageState createState() => _DateTableDemoPageState();
}

class _DateTableDemoPageState extends State<DateTableDemoPage> {

  // List<String> titles = ['姓名', '年龄', '性别', '出生年份', '出生月份'];
  List<Tuple2> titles = [
    Tuple2("姓名", "name",),
    Tuple2("性别", "sex",),
    Tuple2("年龄", "age",),
    Tuple2('出生年份', "birdthYear",),
    Tuple2('出生月份', "birdthMonth",),
  ];

  List<User> models = [
    User(name: "name", sex: "男", age: 28, birdthYear: 2020, birdthMonth: 12),
    User(name: "name1", sex: "女", age: 18, birdthYear: 2018, birdthMonth: 8),
    User(name: "name2", sex: "男", age: 21, birdthYear: 2017, birdthMonth: 5),
    User(name: "name3", sex: "女", age: 19, birdthYear: 2020, birdthMonth: 7),
    User(name: "name4", sex: "男", age: 30, birdthYear: 2019, birdthMonth: 9),
    User(name: "name5", sex: "女", age: 22, birdthYear: 2016, birdthMonth: 18),

    User(name: "name6", sex: "男", age: 28, birdthYear: 2020, birdthMonth: 12),
    User(name: "name7", sex: "女", age: 18, birdthYear: 2018, birdthMonth: 8),
    User(name: "name8", sex: "男", age: 21, birdthYear: 2017, birdthMonth: 5),
    User(name: "name9", sex: "女", age: 19, birdthYear: 2020, birdthMonth: 7),
    User(name: "name10", sex: "男", age: 30, birdthYear: 2019, birdthMonth: 9),

    User(name: "name11", sex: "女", age: 22, birdthYear: 2016, birdthMonth: 18),
    User(name: "name12", sex: "男", age: 28, birdthYear: 2020, birdthMonth: 12),
    User(name: "name13", sex: "女", age: 18, birdthYear: 2018, birdthMonth: 8),
    User(name: "name14", sex: "男", age: 21, birdthYear: 2017, birdthMonth: 5),
    User(name: "name15", sex: "女", age: 19, birdthYear: 2020, birdthMonth: 7),

    User(name: "name16", sex: "男", age: 30, birdthYear: 2019, birdthMonth: 9),
    User(name: "name17", sex: "女", age: 22, birdthYear: 2016, birdthMonth: 18),
    User(name: "name18", sex: "男", age: 28, birdthYear: 2020, birdthMonth: 12),
    User(name: "name19", sex: "女", age: 18, birdthYear: 2018, birdthMonth: 8),
    User(name: "name20", sex: "男", age: 21, birdthYear: 2017, birdthMonth: 5),

    User(name: "name21", sex: "女", age: 19, birdthYear: 2020, birdthMonth: 7),
    User(name: "name22", sex: "男", age: 30, birdthYear: 2019, birdthMonth: 9),
    User(name: "name23", sex: "女", age: 22, birdthYear: 2016, birdthMonth: 18),
    User(name: "name24", sex: "男", age: 30, birdthYear: 2019, birdthMonth: 9),

  ];

  var _sortAscending = true;
  var _sortColumnIndex = 0;

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

    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title ?? "$widget"),
          title: buildSegmentedControl(context),
        ),
        body: buildExcel(context),
    );
  }

  final Map<int, Widget> children = <int, Widget>{
    0: Container(
      padding: EdgeInsets.all(8),
      child: Text(
          "Item 1", style: TextStyle(fontSize: 15, color: Colors.black)),
    ),
    1: Container(
      padding: EdgeInsets.all(8),
      child: Text(
          "Item 2", style: TextStyle(fontSize: 15, color: Colors.black)),
    ),
    2: Container(
      padding: EdgeInsets.all(8),
      child: Text(
          "Item 3", style: TextStyle(fontSize: 15, color: Colors.black)),
    ),
  };

  int groupValue = 0;

  Widget buildSegmentedControl(BuildContext context) {
    return CupertinoSegmentedControl<int>(
      children: children,
      borderColor: Colors.white,
      onValueChanged: (int newValue) {
        setState(() {
          groupValue = newValue;
        });
        ddlog(groupValue);
      },
      groupValue: groupValue,
    );
  }

  Widget buildExcel(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          showBottomBorder: true,
          showCheckboxColumn: true,
          columns: titles.map((e) => DataColumn(
            label: Text(e.item1),
            onSort: (int columnIndex, bool ascending) {
              _changeSort(columnIndex: columnIndex, ascending: ascending);
            },
          )).toList(),
          rows: models.map((e) => DataRow(
            cells: [
              DataCell(Text('${e.name}')),
              DataCell(Text('${e.age}')),
              DataCell(Text('${e.sex}')),
              DataCell(Text('${e.birdthYear}')),
              DataCell(Text('${e.birdthMonth}')),
            ],
            selected: e.isSelected ?? false,
            onSelectChanged: (bool? value) {
              setState(() {
                e.isSelected = value;
              });
              ddlog(models.where((e) => e.isSelected == true).map((e) => "${e.name}_${e.isSelected}").toList());
            },
          )).toList(),
        ),
      ),
    );
  }

  
  void _changeSort({required int columnIndex, required bool ascending}) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;

      switch (columnIndex) {
        case 1:
          {
            if (ascending) {
              models.sort((a, b) => a.age.compareTo(b.age));
            } else {
              models.sort((a, b) => b.age.compareTo(a.age));
            }
          }
          break;

        case 2:
          {
            if (ascending) {
              models.sort((a, b) => a.sex.compareTo(b.sex));
            } else {
              models.sort((a, b) => b.sex.compareTo(a.sex));
            }
          }
          break;

        case 3:
          {
            if (ascending) {
              models.sort((a, b) => a.birdthYear.compareTo(b.birdthYear));
            } else {
              models.sort((a, b) => b.birdthYear.compareTo(a.birdthYear));
            }
          }
          break;

        case 4:
          {
            if (ascending) {
              models.sort((a, b) => a.birdthMonth.compareTo(b.birdthMonth));
            } else {
              models.sort((a, b) => b.birdthMonth.compareTo(a.birdthMonth));
            }
          }
          break;

        default:
          if (ascending) {
            models.sort((a, b) => a.name.compareTo(b.name));
          } else {
            models.sort((a, b) => b.name.compareTo(a.name));
          }
          break;
      }
    });
  }

  ///
  // @override
  // Widget buildDemo(BuildContext context) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: DataTable(
  //       columns: <DataColumn>[
  //         DataColumn(
  //           label: Text('Number'),
  //         ),
  //       ],
  //       rows: List<DataRow>.generate(numItems, (int index) => DataRow(
  //           cells: [ DataCell(Text('Row $index')) ],
  //           selected: selected[index],
  //           onSelectChanged: (bool? value) {
  //             setState(() {
  //               selected[index] = value!;
  //             });
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}


class User {
  User({required this.name, required this.sex, required this.age, required this.birdthYear, required this.birdthMonth});

  final String name;
  final String sex;

  final int age;
  final int birdthYear;
  final int birdthMonth;

  bool? isSelected = false;

}