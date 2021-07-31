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
import 'package:fluttertemplet/dartExpand/richText_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';


///富文本处理
class AttributedString{
  ///  BuildContext context
  final BuildContext context;

  final String text;

  final Map<String, String> linkMap;

  final TextStyle? style;

  final TextStyle? linkStyle;

  final void Function(String key, String value) onTap;
  /// List<TextSpan> by [String text], [Map<String, String> linkMap]
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
  List<TextSpan> _createTextSpans(BuildContext context, {required String text, required Map<String, String> linkMap, TextStyle? style, TextStyle? linkStyle, required void onTap(String key, String value)}) {
    return RichTextExt.createTextSpans(context, text: text, linkMap: linkMap, onTap: onTap);
  }
}