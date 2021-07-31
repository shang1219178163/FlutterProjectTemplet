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
  /// List<TextSpan> by [String text], [Map<String, String> linkMap], prefix = "《", suffix = "》"
  static List<TextSpan> createTextSpans(BuildContext context, {
    String prefix = "《",
    String suffix = "》",
    required String text,
    required Map<String, String> linkMap,
    TextStyle? style,
    TextStyle? linkStyle,
    required void onTap(String key, String value)}) {
    assert(text.isNotEmpty && linkMap.isNotEmpty);

    linkMap.forEach((key, value) {
      assert(key.startsWith(prefix) && key.endsWith("$suffix") && text.contains(key));
    });

    final titles = linkMap.keys;
    final list = text.split(RegExp('$prefix|$suffix'));

    List<TextSpan> textSpans = list
        .map((e) => !titles.contains("$prefix$e$suffix")
        ? TextSpan(text: e, style: style)
        : TextSpan(
      text: "$prefix$e$suffix",
      style: linkStyle ?? TextStyle(color: Theme.of(context).primaryColor),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          onTap("$prefix$e$suffix", linkMap["$prefix$e$suffix"] ?? "");
        },
    ))
        .toList();
    return textSpans;
  }
}