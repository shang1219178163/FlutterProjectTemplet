//
//  notifier_demo.dart
//  fluttertemplet
//
//  Created by shang on 10/13/21 1:58 PM.
//  Copyright © 10/13/21 shang. All rights reserved.
//

///推荐使用 ValueNotifier, ChangeNotifier 太繁琐

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:fluttertemplet/dartExpand/ddlog.dart';
import 'package:fluttertemplet/model/order_model.dart';

/// ChangeNotifier(不推荐使用,麻烦)
class CartModel extends ChangeNotifier {
  final List<OrderModel> _items = []; // 购物车内容, 设为private
  // 只读的购物车内容(getter)
  UnmodifiableListView<OrderModel> get items => UnmodifiableListView(_items);

  // double get totalPrice => _items.map((e) => e.pirce).reduce((value, element) => value + element); // 当前购物车总价的getter(假设每件都是42块)
  double get totalPrice {
    if (_items.length == 0) {
      return 0;
    }
    return _items.map((e) => e.pirce).reduce((value, element) => value + element).roundToDouble();
  }

  /// 加入物品到购物车
  void add(OrderModel item) {
    _items.add(item);
    notifyListeners(); // <==***This call tells the widgets that are listening to this model to rebuild.
  }

  /// 删除商品
  void remove(int index) {
    if (_items.length < index) {
      return;
    }
    _items.removeAt(index);
    notifyListeners(); // <==***This call tells the widgets that are listening to this model to rebuild.
  }

  /// 删除最后商品
  void removeLast() {
    if (_items.length == 0) {
      return;
    }
    _items.removeLast();
    notifyListeners(); // <==***This call tells the widgets that are listening to this model to rebuild.
  }

  /// 清空购物车
  void removeAll() {
    _items.clear();
    notifyListeners(); // <==***This call tells the widgets that are listening to this model to rebuild.
  }

  @override
  String toString() {
    return "${this.runtimeType} 共 ${_items.length} 件商品,总价: ¥${totalPrice.toString()}";
  }
}


/// ValueNotifier<List<OrderModel>>
class ValueNotifierOrderModels extends ValueNotifier<List<OrderModel>> {

  ValueNotifierOrderModels() : super(<OrderModel>[]); // 构造函数要提供value的初始值

  // double get totalPrice => value.map((e) => e.pirce).reduce((value, element) => value + element); // 当前购物车总价的getter(假设每件都是42块)
  double get totalPrice {
    if (value.length == 0) {
      return 0;
    }
    return value.map((e) => e.pirce).reduce((value, element) => value + element).roundToDouble();
  }

  void add(OrderModel item) {
    value.add(item);
    _copyValue();
  }

  /// 删除
  void remove(int index) {
    if (value.length < index) {
      return;
    }
    value.removeAt(index);
    _copyValue();
  }

  /// 删除最后商品
  void removeLast() {
    if (value.length == 0) {
      return;
    }
    value.removeLast();
    _copyValue();
  }

  void removeAll() {
    value.clear();
    _copyValue();
  }

  /// 进行深copy(原理与iOS的kvo原理类似.list添加元素,未改变地址,所以无法触发监听,利用深copy 重新赋值,就触发监听了)
  void _copyValue() {
    value = [...value];
  }

  @override
  String toString() {
    return "${this.runtimeType} 共 ${value.length} 件商品,总价: ¥${totalPrice.toString()}";
  }
}

/// 泛型数组监听
class ValueNotifierList<T> extends ValueNotifier<List<T>> {

  ValueNotifierList(List<T> initValue) : super(initValue);

  void add(T item) {
    value.add(item);
    _copyValue();
  }

  /// 删除
  void remove(int index) {
    if (value.length < index) {
      return;
    }
    value.removeAt(index);
    _copyValue();
  }

  /// 删除最后
  void removeLast() {
    if (value.length == 0) {
      return;
    }
    value.removeLast();
    _copyValue();
  }

  void removeAll() {
    value.clear();
    _copyValue();
  }
  /// 进行深copy(原理与iOS的kvo原理类似.list添加元素,未改变地址,所以无法触发监听,利用深copy 重新赋值,就触发监听了)
  void _copyValue() {
    value = [...value];
  }

  @override
  String toString() {
    return "${this.runtimeType} 共 ${value.length} 件商品}";
  }
}


/// StateNotifier(需要安装第三方插件包)
// class CartModel extends StateNotifier<List<OrderModel>> {
//   CartModel(): super(<OrderModel>[]); // 构造函数要提供state的初始值
//
//  int get totalPrice => state.length * 42;
//
//   void add(OrderModel item) {
//    state.add(item);
//   }
//
//   void removeAll() {
//    state.clear();
//   }
// }

/// ValueNotifier<int>
class ValueNotifierInt extends ValueNotifier<int> {

  int initValue = 0;

  int minValue = 0;

  int maxValue = 100000;

  void Function(int minValue, int maxValue)? block;

  ValueNotifierInt({required this.initValue, required this.minValue, required this.maxValue, this.block}) : super(initValue);

  void add(int val) {
    if (val < 0 && value <= minValue) {
      if (block != null) block!(minValue, maxValue);
      return;
    }

    if (val > 0 && value >= maxValue) {
      if (block != null) block!(minValue, maxValue);
      return;
    }
    value += val;
  }

  @override
  String toString() {
    return "${this.runtimeType} 当前值 ${value.toString()}";
  }
}


/// ValueNotifier<double>
class ValueNotifierDouble extends ValueNotifier<double> {

  ValueNotifierDouble(double initValue) : super(initValue);

  void add(double val) {
    value += val;
  }

  @override
  String toString() {
    return "${this.runtimeType} 当前值 ${value.toStringAsFixed(2)}";
  }
}