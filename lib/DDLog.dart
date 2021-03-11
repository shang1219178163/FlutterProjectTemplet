
// import 'package:flutter/material.dart';
//⚠️ 自定义 日志打印方法

// ignore: non_constant_identifier_names
void DDLog(dynamic message, StackTrace current){
  DDTraceModel model = DDTraceModel(current);
  print("${DateTime.now()}  ${model.fileName}, ${model.className} [line ${model.lineNumber}]: $message");
}

class DDTraceModel {
  final StackTrace _trace;

  String fileName;
  String className;
  int lineNumber;
  int columnNumber;

  DDTraceModel(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._trace.toString().split("\n")[0];
    this.className = traceString.split(".")[0].replaceAll("#0", "").trim();
    // print('___${this.className}_$traceString');

    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);

    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}
