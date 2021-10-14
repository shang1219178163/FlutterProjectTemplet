//
//  provider_list_demo.dart
//  fluttertemplet
//
//  Created by shang on 10/13/21 11:30 AM.
//  Copyright © 10/13/21 shang. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/model/order_model.dart';
import 'package:fluttertemplet/routes/APPRouter.dart';
import 'package:tuple/tuple.dart';
import 'notifier_demo.dart';


class ProviderListDemo extends StatefulWidget {

  final String? title;

  ProviderListDemo({ Key? key, this.title}) : super(key: key);

  @override
  _ProviderListDemoState createState() => _ProviderListDemoState();
}

class _ProviderListDemoState extends State<ProviderListDemo> {
  /// ChangeNotifier
  static ChangeNotifierOrderModels changeNotifierOrderModels = ChangeNotifierOrderModels();
  /// ValueNotifier
  static ValueNotifierOrderModels valueNotifierOrderModels = ValueNotifierOrderModels();
  /// ValueNotifier
  static ValueNotifierInt valueNotifierInt = ValueNotifierInt(6);
  /// ValueNotifier
  static ValueNotifierDouble valueNotifierDouble = ValueNotifierDouble(8.8);

  static ValueNotifierItems valueNotifierItems = ValueNotifierItems(<OrderModel>[]);

  // static ValueNotifierItems valueNotifierItems = ValueNotifierItems(<OrderModel>[]);

  @override
  void initState() {
    super.initState();

    // valueNotifierInt.value = 6;
    // valueNotifierDouble.value = 9.9;
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
          actions: [
            IconButton(onPressed: (){
              updateChangeNotifier(model: changeNotifierOrderModels, value: 1);

            }, icon: Icon(Icons.add_circle_outline,)),
            IconButton(onPressed: (){
              updateChangeNotifier(model: changeNotifierOrderModels, value: -1);

            }, icon: Icon(Icons.remove_circle_outline,)),

          ],
        ),
        // body: Text("当前数量${cartCountKey.value}")
        body: ListView.separated(
          itemBuilder: (ctx, idx) {
            // list.sort((a, b) => a.item1.compareTo(b.item1));
            final e = list[idx];
            return Container(
              height: 70,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    handleActionNum(e: e, value: 1, idx: idx);

                  }, icon: Icon(Icons.add_circle_outline, color: Theme.of(context).primaryColor,)),
                  IconButton(onPressed: (){
                    handleActionNum(e: e, value: -1, idx: idx);

                  }, icon: Icon(Icons.remove_circle_outline, color: Theme.of(context).primaryColor,)),
                  // SizedBox(width: 8,),
                  // Text("${e.name}当前值: ${e.notifier?.value}"),
                  Expanded(
                    child: Text("${e.notifier.toString()}", overflow: TextOverflow.ellipsis, softWrap: true,)
                  ),
                  // Container(
                  //   height: 50,
                  //   child: Text("${e.notifier.toString()}", overflow: TextOverflow.ellipsis,),
                  // )
                  // Text("${e.notifier.toString()}", style: TextStyle(),),
                ],
              ),
            );
          },
          itemCount: list.length,
          separatorBuilder: (context, index) {
            return Divider(
              height: .5,
              indent: 15,
              endIndent: 15,
              color: Color(0xFFDDDDDD),
            );
          },
        ),
    );
  }


  void handleActionNum({required ValueNotifierModel e, required int value, required int idx}) {
    switch (e.name) {
      case "valueNotifierIntKey":
        {
          valueNotifierInt.add(value);
          setState(() {

          });
          // ddlog(cartCountKey.toString());
          ddlog("${valueNotifierInt.value}");
        }
        break;
      case "valueNotifierDoubleKey":
        {
          ddlog("${value.toDouble()}");
          valueNotifierDouble.add(value.toDouble());
          setState(() {

          });
          // ddlog(cartCountKey.toString());
          ddlog("${valueNotifierDouble.value}");
        }
        break;


      case "changeNotifierOrderModels":
        {
          final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
          if (value > 0) {
            changeNotifierOrderModels.add(e);
          } else {
            changeNotifierOrderModels.removeLast();
          }

          setState(() {

          });
          ddlog(changeNotifierOrderModels.toString());
          // ddlog("${cartModelKey.totalPrice}");
        }
        break;
      case "valueNotifierOrderModels":
        {
          final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
          if (value > 0) {
            valueNotifierOrderModels.add(e);
          } else {
            valueNotifierOrderModels.removeLast();
          }

          setState(() {

          });
          ddlog(valueNotifierOrderModels.toString());
          // ddlog("${cartModelOneKey.totalPrice}");
        }
        break;
      case "valueNotifierItems":
        {
          final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
          if (value > 0) {
            valueNotifierItems.add(e);
          } else {
            valueNotifierItems.removeLast();
          }

          setState(() {

          });
          ddlog(valueNotifierItems.toString());
          // ddlog("${cartModelOneKey.totalPrice}");
        }
        break;

      default:
        break;
    }
  }

  void updateChangeNotifier({required ChangeNotifierOrderModels model, required int value}) {
    final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
    if (value > 0) {
      model.add(e);
    } else {
      model.removeLast();
    }
    setState(() {

    });
    ddlog(model.toString());
  }

  var list = [
    ValueNotifierModel(name: "valueNotifierIntKey", notifier: valueNotifierInt),
    ValueNotifierModel(name: "valueNotifierDoubleKey", notifier: valueNotifierDouble),
    ValueNotifierModel(name: "valueNotifierOrderModels", notifier: valueNotifierOrderModels),
    ValueNotifierModel(name: "valueNotifierItems", notifier: valueNotifierItems),
  ];

}



class ValueNotifierModel{

  String name = "";
  ValueNotifier? notifier;
  // ChangeNotifier? notifier;

  ValueNotifierModel({
    required this.name,
    required this.notifier,
  });

  ValueNotifierModel.fromJson(Map json){
    if(json.isEmpty){
      return;
    }
    notifier = json["notifier"];
    name = json["name"].stringValue;
  }

  Map<String, dynamic> toJson(){
    var json = Map<String, dynamic>();
    json["name"] = name;
    json["notifier"] = notifier;
    return json;
  }

}
