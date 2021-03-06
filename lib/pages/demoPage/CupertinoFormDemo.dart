import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplet/basicWidget/NNDatePicker.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';

class CupertinoFormDemo extends StatefulWidget {
  final String? title;

  CupertinoFormDemo({Key? key, this.title}) : super(key: key);

  @override
  _CupertinoFormDemoState createState() => _CupertinoFormDemoState();
}

class _CupertinoFormDemoState extends State<CupertinoFormDemo> {
  late TextEditingController _textController =
      TextEditingController(text: 'initial text');

  bool isSwitch = true;

  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "$widget"),
      ),
      body: buildCupertinoForm(context),
      // body: buildbody(context),
    );
  }

  Widget buildCupertinoForm(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              CupertinoFormSection.insetGrouped(
                  header: Text('SECTION 1'),
                  children: [
                    CupertinoFormRow(
                      padding: EdgeInsets.all(15),
                      child: InkWell(
                        child: buildSubtitleRow(context),
                        onTap: () {
                          ddlog("buildSubtitleRow");
                        },
                      ),
                    ),
                    CupertinoFormRow(
                      child: InkWell(
                        child: buildRightButtonRow(context),
                        onTap: () {
                          ddlog("buildRightButtonRow");
                        },
                      ),
                    ),
                    CupertinoFormRow(
                      child: InkWell(
                        child: buildSwitchRow(context),
                        onTap: () {
                          ddlog("buildSwitchRow");
                        },
                      ),
                    ),
                    CupertinoFormRow(
                      child: InkWell(
                        child: buildDatePickerRow(context),
                        onTap: () {
                          showDatePicker(context);
                        },
                      ),
                    ),
                    CupertinoTextFormFieldRow(
                      prefix: Text('TextField'),
                      placeholder: 'Enter text',
                      textAlign: TextAlign.end,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        if (value.length < 6) {
                          return '??????????????????6';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ddlog(value);
                        setState(() {

                        });
                      },
                      onEditingComplete: () {
                        ddlog("onEditingComplete");
                      },
                    ),
                  ]),
              CupertinoFormSection.insetGrouped(
                header: Text('SECTION 2'),
                children: List<Widget>.generate(5, (int index) {
                  return CupertinoTextFormFieldRow(
                    prefix: Text('TextField'),
                    placeholder: 'Enter text',
                    textAlign: TextAlign.end,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogo(Widget? child) {
    return Padding(
      //Paddng?????????????????????Image????????????
      padding: EdgeInsets.only(right: 5), //????????????????????????1
      child: ClipRRect(
        //????????????????????????
        borderRadius: BorderRadius.circular(8.0), //???????????????8
        // child: Image.asset(data.appIcon, width: 60, height: 60),
        child: child,
      ),
    );
  }

  Widget buildSubtitleRow(BuildContext context) {
    return Row(children: <Widget>[
      buildLogo(FlutterLogo(
        size: 30,
      )),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //????????????????????????
          crossAxisAlignment: CrossAxisAlignment.start, //????????????????????????
          children: <Widget>[
            Text("title", maxLines: 1, overflow: TextOverflow.ellipsis),
            Text("subtitle", maxLines: 1),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    ]);
  }

  Widget buildDatePickerRow(BuildContext context) {
    return Row(children: <Widget>[
      // buildLogo(FlutterLogo(size: 30,)),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //????????????????????????
          crossAxisAlignment: CrossAxisAlignment.start, //????????????????????????
          children: <Widget>[
            Text("????????????"),
          ],
        ),
      ),
      Text(
          dateTime.toString() == "null"
              ? "choose"
              : dateTime.toString().split(".").first,
          maxLines: 1),
      // TextButton(
      //   onPressed: onPressed,
      //   child: Text(dateTime.toString() == "null" ? "choose" : dateTime.toString().split(".").first, maxLines: 1),),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    ]);
  }

  Widget buildSwitchRow(BuildContext context) {
    return Row(children: <Widget>[
      // buildLogo(FlutterLogo(size: 30,)),
      Expanded(
        child: Text(
          "title",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      CupertinoSwitch(
          value: isSwitch,
          onChanged: (value) {
            setState(() {
              isSwitch = !isSwitch;
            });
          }),
    ]);
  }

  Widget buildRightButtonRow(BuildContext context) {
    return Row(children: <Widget>[
      // buildLogo(FlutterLogo(size: 30,)),
      Expanded(
        child: Text(
          "title",
        ),
      ),
      TextButton(
        onPressed: () {
          ddlog("button");
        },
        child: Text(
          "button",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ]);
  }

  ///?????????????????????
  void showDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return NNDatePicker(
            // mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (val) {
              ddlog(val.toString());
              dateTime = val;
            },
            confirmOnPressed: () {
              ddlog("confirm");
              setState(() {});

              Navigator.of(context).pop();
            },
            cancellOnPressed: () {
              ddlog("cancell");
              Navigator.of(context).pop();
            },
          );
        });
  }
}
