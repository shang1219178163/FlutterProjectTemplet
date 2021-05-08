//
//
// ignore: avoid_web_libraries_in_flutter
// import 'package:flutter/cupertino.dart' show BuildContext, Navigator;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DDLog.dart' show DDLog;

extension NavigatorExt on Navigator{

  static void popPage(BuildContext context, [StackTrace? current]){
    if (!Navigator.canPop(context)) {
      if (current != null) {
        DDLog("已经是根页面了！", current);
      }
      return;
    }
    Navigator.pop(context);
  }

  // static void popPage(BuildContext context, Dynamic? obj, [StackTrace? current]){
  //   if (!Navigator.canPop(context)) {
  //     if (current != null) {
  //       DDLog("已经是根页面了！", current);
  //     }
  //     return;
  //   }
  //   Navigator.pop(context, obj);
  // }
}

enum ImageAlignment {
  /// 文字左边
  left,

  /// 文字顶部
  top,

  /// 文字右边
  right,

  /// 文字底部
  bottom,
}

extension TextButtonExt on TextButton{

  static TextButton build({
    required String text,
    required Widget image,
    required ImageAlignment imageAlignment,
    required void callback(String value)}) {
    switch (imageAlignment) {
      case ImageAlignment.left:
        return TextButton(
          onPressed: () => callback(text),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              image,
              SizedBox(width: 8),
              Text(text),
            ],
          ),
        );

      case ImageAlignment.top:
        return TextButton(
          onPressed: () => callback(text),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              image,
              SizedBox(width: 8),
              Text(text),
            ],
          ),
        );

      case ImageAlignment.right:
        return TextButton(
          onPressed: () => callback(text),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text),
              SizedBox(width: 8),
              image,
            ],
          ),
        );

      case ImageAlignment.bottom:
        return TextButton(
          onPressed: () => callback(text),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text),
              SizedBox(width: 8),
              image,
            ],
          ),
        );
    }
  }

}

// extension WidgetExt on Widget{
//
//   // ignore: non_constant_identifier_names, missing_return
//   static Widget buildBtn(String text, Widget image, ImageAlignment imageAlignment) {
//     if (image == null) {
//       return Text(text ?? "",);
//     }
//
//     switch (imageAlignment) {
//       case ImageAlignment.left:
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             image,
//             SizedBox(width: 8),
//             Text(text ?? "",),
//           ],
//         );
//       case ImageAlignment.top:
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             image,
//             SizedBox(width: 8),
//             Text(text ?? "",),
//           ],
//         );
//       case ImageAlignment.right:
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(text ?? "",),
//             SizedBox(width: 8),
//             image,
//           ],
//         );
//       case ImageAlignment.bottom:
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(text ?? "",),
//             SizedBox(width: 8),
//             image,
//           ],
//         );
//     }
//   }
//
// }


// class OutlinedButton extends ButtonStyleButton {
//
//
// }


// extension on TextStyle {
//
//   TextStyle colorChain(Color? color){
//     this.color = color;
//     return this;
//   }
//
// }
