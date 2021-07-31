//
//  richText_extension.dart
//  fluttertemplet
//
//  Created by shang on 7/31/21 1:48 PM.
//  Copyright © 7/31/21 shang. All rights reserved.
//



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


extension RichTextExt on RichText{
  /// List<TextSpan> by [String text], [Map<String, String> linkMap]
  static List<TextSpan> createTextSpans(BuildContext context, {required String text, required Map<String, String> linkMap, TextStyle? style, TextStyle? linkStyle, required void onTap(String key, String value)}) {
    assert(text.isNotEmpty && linkMap.isNotEmpty);
    linkMap.forEach((key, value) {
      assert(key.startsWith("《") && key.endsWith("》") && text.contains(key));
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
            onTap("《$e》", linkMap["《$e》"] ?? "");
        },
    ))
        .toList();
    return textSpans;
  }
}