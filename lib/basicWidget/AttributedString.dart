//
//  AttributedString.dart
//  fluttertemplet
//
//  Created by shang on 7/31/21 12:08 PM.
//  Copyright © 7/31/21 shang. All rights reserved.
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


///富文本处理
class AttributedString{
  ///  BuildContext context
  final BuildContext context;

  final String text;

  final Map<String, String> linkMap;

  final TextStyle? style;

  final TextStyle? linkStyle;

  void Function(String key, String value)? onTap;

  List<TextSpan>? get textSpans => _createTextSpans(context, text: text, linkMap: linkMap, style: style, linkStyle: linkStyle, onTap: onTap);

  AttributedString({
    required this.context,
    required this.text,
    required this.linkMap,
    this.style,
    this.linkStyle,
    required this.onTap
  });

  /// List<TextSpan> by [String text], [Map<String, String> linkMap]
  List<TextSpan> _createTextSpans(BuildContext context, {required String text, required Map<String, String> linkMap, TextStyle? style, TextStyle? linkStyle, void onTap(String key, String value)?}) {
    assert(text.isNotEmpty);
    assert(linkMap.isNotEmpty);
    linkMap.forEach((key, value) {
      assert(text.contains(key));
    });

    final titles = linkMap.keys;
    final key = titles.join("|");
    // ddlog(key);
    final list = text.split(RegExp('《|》'));
    // ddlog(list.length);

    List<TextSpan> textSpans = list
        .map((e) => !titles.contains("《$e》")
        ? TextSpan(text: e, style: style)
        : TextSpan(
      text: "《$e》",
      style: linkStyle ?? TextStyle(color: Theme.of(context).primaryColor),
      // style: TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          if (onTap != null) {
            onTap("《$e》", linkMap["《$e》"] ?? "");
            return;
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return buildWebView(context,
                initialUrl: linkMap["《$e》"] ?? '');
          }));
        },
    ))
        .toList();
    return textSpans;
  }

  ///创建 WebView
  Widget buildWebView(BuildContext context, {required String initialUrl}) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Container(
            child: Row(
              children: [Icons.chevron_left, Icons.close]
                  .map(
                    (e) => IconButton(
                  icon: Icon(e),
                  iconSize: 30,
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    if (e == Icons.chevron_left) {
                      Navigator.of(context).pop();
                    } else if (e == Icons.close) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              )
                  .toList(),
            ),
          ),
          actions: [Icons.refresh,].map((e) => IconButton(
            icon: Icon(e),
            iconSize: 30,
            // color: Theme.of(context).accentColor,
            onPressed: () {
              print(Icons.refresh);
            },
          ),).toList(),
        ),
        body: WebView(initialUrl: initialUrl));
  }
}