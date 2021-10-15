//
//  string_extension.dart
//  fluttertemplet
//
//  Created by shang on 8/3/21 11:41 AM.
//  Copyright © 8/3/21 shang. All rights reserved.
//


extension StringExt on String{
  /// 获取匹配到的元素数组
  List<String> allMatchesByReg(RegExp regExp) {
    final reg = regExp.allMatches(this);
    final list = reg.map((e) => e.group(0)).whereType<String>().toList();
    return list;
  }
  ///首字母大写
  String toCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}