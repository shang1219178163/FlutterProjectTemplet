import 'package:flutter/material.dart';
import 'package:fluttertemplet/basicWidget/DefaultCellCard.dart';
import 'package:fluttertemplet/basicWidget/TableCellWidget.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppCard.dart';
import 'package:fluttertemplet/basicWidget/UpdateAppNewCard.dart';

import 'Model/UserModel.dart';
import 'Model/AppUpdateItemModel.dart';
import 'package:fluttertemplet/mockData/mock_data.dart';

class NNListWidgetPage extends StatefulWidget {

  NNListWidgetPage({Key? key}) : super(key: key);

  @override
  _NNListWidgetPageState createState() => _NNListWidgetPageState();
}

class _NNListWidgetPageState extends State<NNListWidgetPage> {

  late List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget列表"),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
        body: NNListWidget(list: list)
    );
  }
}


class NNListWidget extends StatelessWidget {

  final List<dynamic> list;

  const NNListWidget({
    Key? key,
    required this.list,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return TableCellWidget(data: list[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          indent: 15,
          endIndent: 15,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}


class NNListOneWidget extends StatelessWidget {

  final List<UserModel> list;

  const NNListOneWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      cacheExtent: 180,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final data = list[index];
        return DefaultCellCard(
          titleText: Text(
            data.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          detailTitleText: Text(
            data.content,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF999999),
            ),
          ),
          titleMarkText: Text(
            data.time,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF999999),
            ),
          ),
          detailTitleMarkText: Text(
            "有效",
            style: TextStyle(
              fontSize: 13,
              color: Colors.lightGreen,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          indent: 15,
          endIndent: 15,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}

