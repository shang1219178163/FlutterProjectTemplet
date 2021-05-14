
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/DartExpand/DDLog.dart';
import 'package:styled_widget/styled_widget.dart';
import 'DartExpand/ActionSheet_extension.dart';
import 'DartExpand/Widget_extension.dart';

class PickerDemoPage extends StatefulWidget {

  @override
  _PickerDemoPageState createState() => _PickerDemoPageState();
}

class _PickerDemoPageState extends State<PickerDemoPage> {

  var titles = ["datePicker", "datePicker", "datePicker",
    "3", "4", "5", "6", "7", "8"];

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
          title: Text(arguments[1]),
        ),
        // body: buildWrap(context).padding(all: 10)
        body: buildGridView(titles)

    );
  }

  Widget buildGridView(List<String> list) {
    return GridView.count(
      padding: EdgeInsets.all(15.0),
      //一行多少个
      crossAxisCount: 3,
      //滚动方向
      scrollDirection: Axis.vertical,
      // 左右间隔
      crossAxisSpacing: 8,
      // 上下间隔
      mainAxisSpacing: 8,
      //宽高比
      childAspectRatio: 1 / 0.3,

      children: initListWidget(list),
    );
  }

  List<Widget> initListWidget(List<String> list) {
    List<Widget> lists = [];
    for (var item in list) {
      lists.add(
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${item}", style: TextStyle(fontSize: 15),),
            ],
          ),
        )
            .border(all: 1, color: Colors.lightBlue,)
            .gestures(onTap: () => {
              // DDLog("$item")
          widget.showDatePicker(context: context, mode: CupertinoDatePickerMode.dateAndTime, callback: (datetime, title){
            DDLog("$datetime, $title");
          })
        }),
      );
    }
    return lists;
  }


  void _onPressed(int e) {
    switch (e) {
      case 1:
        _onButtonClick(CupertinoDatePickerMode.date);
        break;

      case 2:
        _onButtonClick(CupertinoDatePickerMode.time);
        break;

      case 3:
        {

        }
        break;

      case 4:
        {

        }
        break;

      case 5:
        {

        }
        break;

      case 6:
        {

        }
        break;

      case 7:
        {

        }
        break;

      case 8:
        {

        }
        break;

      default:
        // _onButtonClick(CupertinoDatePickerMode.dateAndTime);
        break;
    }
    // CupertinoDatePicker(
    //   mode: CupertinoDatePickerMode.dateAndTime,
    //   initialDateTime: dateTime,
    //   onDateTimeChanged: (DateTime newDateTime) {
    //     // setState(() => dateTime = newDateTime);
    //   },
    // ).show(context);
    // _showDatePicker(context);
    DDLog(e);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return DatePickerPage();
    // }));
  }

  DateTime dateTime = DateTime.now();

  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        dateTime = val;
                      });
                    }),
              ),
              CupertinoButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ));
  }

  void _onButtonClick(CupertinoDatePickerMode mode) {
    setState(() {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return _buildBottomPicker(
            CupertinoDatePicker(
              mode: mode,
              initialDateTime: dateTime,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() => dateTime = newDateTime);
              },
            ),
          );
        },
      );
    });
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
          style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
          ),
          child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
            onTap: () {
              DDLog("picker");
            },
            child: SafeArea(
              top: false,
              child: picker,
            ),
          ),
      ),
    );
  }
}



class DatePickerPage extends StatefulWidget {
  DateTime? dateTime = DateTime.now();
  void Function(DateTime dateTime)? callback;

  DatePickerPage({
    this.dateTime,
    this.callback,
  });

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  @override
  Widget build(BuildContext context) {

    final time = widget.dateTime != null ? widget.dateTime!.toString19() : 'datetime picked';
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$widget.dateTime'),
        // This button triggers the _showDatePicker function
        trailing: Container(child:
        CupertinoButton(
          padding: EdgeInsetsDirectional.zero,
          child: Text('Show Picker'),
          onPressed: () {
            // _showDatePicker(context);
            _datePickerValueChange(context);
          },
        ),),
      ),
      child: SafeArea(
        child: Center(
          child: TextButton(
            child: Text(time),
            onPressed: (){
            // _showDatePicker(context);
              _datePickerValueChange(context);
            },
          )
        ),
      ),
    );
  }

  ///时间变动
  void _datePickerValueChange(context) {
    widget.showDatePicker(context: context, mode: CupertinoDatePickerMode.dateAndTime, callback: (datetime, title){
      DDLog("$datetime, $title");
      if (title == "取消") {
        return;
      }
      setState(() {
        widget.dateTime = datetime;
      });
    });

    // groovyScript("def result = ''; _1.split().eachWithIndex { item, index -> result = result + index.next() + '. ' + item + System.lineSeparator() }; return result;", SELECTION);
    // groovyScript("return _editor.filePath().split('/').get(4)");
  }


// Show the modal that contains the CupertinoDatePicker
  // void _showDatePicker(context) {
  //   // showCupertinoModalPopup is a built-in function of the cupertino library
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (_) => Container(
  //         height: 300,
  //         // color: Color.fromARGB(255, 255, 255, 255),
  //         color: Colors.white,
  //         child: Column(
  //           children: [
  //             Row(children: [
  //               // Close the modal
  //               CupertinoButton(
  //                 child: Text('取消'),
  //                 // onPressed: () => Navigator.of(ctx).pop(),
  //                 onPressed: (){
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               Expanded(child: Text("请选择",
  //                 style: TextStyle(fontSize: 17,
  //                     color: Colors.black,
  //                     backgroundColor: Colors.white),
  //                 textAlign: TextAlign.center,)
  //               ),
  //
  //               CupertinoButton(
  //                 child: Text('确定'),
  //                 // onPressed: () => Navigator.of(ctx).pop(),
  //                 onPressed: (){
  //                   if (widget.callback != null){
  //                     widget.callback!(widget.dateTime!);
  //                   }
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],),
  //             Container(
  //               height: 216,
  //               color: Colors.white,
  //               child: CupertinoDatePicker(
  //                   initialDateTime: widget.dateTime,
  //                   onDateTimeChanged: (val) {
  //                     setState(() {
  //                       widget.dateTime = val;
  //                       DDLog(val);
  //                     });
  //                   }),
  //             ),
  //           ],
  //         ),
  //       ));
  // }

}
