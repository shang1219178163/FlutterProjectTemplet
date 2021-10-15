//
//  provider_list_demo.dart
//  fluttertemplet
//
//  Created by shang on 10/13/21 11:30 AM.
//  Copyright © 10/13/21 shang. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/dartExpand/buildContext_extension.dart';
import 'package:fluttertemplet/dartExpand/string_extension.dart';

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
  static CartModel changeNotifierCartModel = CartModel();
  /// ValueNotifier(addListener无效)
  static ValueNotifierOrderModels valueNotifierOrderModels = ValueNotifierOrderModels();
  /// ValueNotifier
  static ValueNotifierInt valueNotifierInt = ValueNotifierInt(initValue: 6, minValue: 0, maxValue: 9, block: (int minValue, int maxValue){
    ddlog("数值必须在${minValue} - ${maxValue} 之间");
  });
  // static ValueNotifierInt valueNotifierInt = ValueNotifierInt(initValue: 6, minValue: 0, maxValue: 9);

  static ValueNotifier<int> valueNotifierIntOrigin = ValueNotifier(3);

  /// ValueNotifier
  static ValueNotifierDouble valueNotifierDouble = ValueNotifierDouble(8.8);
  /// ValueNotifier(addListener无效)
  static ValueNotifierList valueNotifierList = ValueNotifierList(<OrderModel>[]);

  static ValueNotifier<List<OrderModel>> valueNotifierListOrigin = ValueNotifier(<OrderModel>[]);

  @override
  void initState() {
    super.initState();

    // valueNotifierInt.value = 6;
    // valueNotifierDouble.value = 9.9;

    valueNotifierInt.maxValue = 12;

    valueNotifierIntOrigin.addListener(update);
    valueNotifierInt.addListener(update);
    valueNotifierDouble.addListener(update);

    valueNotifierOrderModels.addListener(update);
    valueNotifierList.addListener(update);
    valueNotifierListOrigin.addListener(update);
  }

  @override
  void dispose() {
    valueNotifierInt.removeListener(update);
    valueNotifierIntOrigin.removeListener(update);
    valueNotifierDouble.removeListener(update);

    valueNotifierOrderModels.removeListener(update);
    valueNotifierList.removeListener(update);
    valueNotifierListOrigin.removeListener(update);
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
              updateChangeNotifier(model: changeNotifierCartModel, value: 1);

            }, icon: Icon(Icons.add_circle_outline,)),

            IconButton(onPressed: (){
              updateChangeNotifier(model: changeNotifierCartModel, value: -1);

            }, icon: Icon(Icons.remove_circle_outline,)),

          ],
        ),
        // body: Text("当前数量${cartCountKey.value}")
        body: Column(
          children: [
            buildList(context),
            // Column(
            //   children: [
            //     Container(
            //       height: 70,
            //       child: Text("data"),
            //     )
            //   ],
            // )
          ],
        ),
    );
  }
  
  Widget buildList(BuildContext context) {
    return ListView.separated(
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
    );
  }

  void update() {
    ddlog("数据变化监听回调, 刷新重建界面");
    setState(() {});
  }

  void handleActionNum({required ValueNotifierModel e, required int value, required int idx}) {
    switch (e.name) {
      case "valueNotifierIntKey":
        {
          valueNotifierInt.add(value);
        }
        break;
      case "valueNotifierDoubleKey":
        {
          ddlog("${value.toDouble()}");
          valueNotifierDouble.add(value.toDouble());

          // ddlog(cartCountKey.toString());
          ddlog("${valueNotifierDouble.value}");
        }
        break;

      case "changeNotifierOrderModels":
        {
          final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
          if (value > 0) {
            changeNotifierCartModel.add(e);
          } else {
            changeNotifierCartModel.removeLast();
          }

          ddlog(changeNotifierCartModel.toString());
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

          update();

          ddlog(valueNotifierOrderModels.toString());
          // ddlog("${cartModelOneKey.totalPrice}");
        }
        break;
      case "valueNotifierList":
        {
          final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
          if (value > 0) {
            valueNotifierList.add(e);
          } else {
            valueNotifierList.removeLast();
          }
          update();

          ddlog(valueNotifierList.toString());
          // ddlog("${cartModelOneKey.totalPrice}");
        }
        break;

      case "valueNotifierIntOrigin":
        {
          valueNotifierIntOrigin.value += value;

          // ddlog(cartCountKey.toString());
          ddlog("${valueNotifierIntOrigin.value}");
        }
        break;

      case "valueNotifierListOrigin":
        {
          final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
          if (value > 0) {
            valueNotifierListOrigin.value.add(e);
          } else {
            valueNotifierListOrigin.value.removeLast();
          }

          ddlog(valueNotifierListOrigin.value.length.toString());
          // ddlog("${cartModelOneKey.totalPrice}");
        }
        break;
      default:
        break;
    }
  }

  void updateChangeNotifier({required CartModel model, required int value}) {
    final e = OrderModel(name: '商品', id: 99, pirce: 1.00);
    if (value > 0) {
      model.add(e);
    } else {
      model.removeLast();
    }

    update();
    ddlog(model.toString());

    if (value > 0) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('CartModel num\'s +1')));

    } else {
      showSnackBar(SnackBar(content: Text('CartModel num\'s -1')), true);
    }

  }

  var list = [
    // ValueNotifierModel(name: "valueNotifierIntKey", notifier: valueNotifierInt),
    // ValueNotifierModel(name: "valueNotifierDoubleKey", notifier: valueNotifierDouble),
    ValueNotifierModel(name: "valueNotifierOrderModels", notifier: valueNotifierOrderModels),
    ValueNotifierModel(name: "valueNotifierList", notifier: valueNotifierList),

    // ValueNotifierModel(name: "valueNotifierIntOrigin", notifier: valueNotifierIntOrigin),
    ValueNotifierModel(name: "valueNotifierListOrigin", notifier: valueNotifierListOrigin),

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
