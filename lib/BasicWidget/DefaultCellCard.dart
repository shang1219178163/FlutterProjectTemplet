import 'package:flutter/material.dart';

class DefaultCellCard extends StatelessWidget {

  final Image? image;
  final Text titleText;
  final Text? detailTitleText;
  final Text? titleMarkText;
  final Text? detailTitleMarkText;

  const DefaultCellCard({
    Key? key,
    this.image,
    required this.titleText,
    this.titleMarkText,
    this.detailTitleText,
    this.detailTitleMarkText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
              child: Image(image: AssetImage("assets/icon_light_unselected.png"),
                width: 40,
                height: 40,
              )
            // child: image != null ? image : Image.asset("icon_light_unselected")
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleText,
                    if (titleMarkText != null) titleMarkText!,
                    ]
                ),
                Padding(padding: EdgeInsets.only(top: 2)),
                // titleText,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (detailTitleText != null) detailTitleText!,
                      if (detailTitleMarkText != null) detailTitleMarkText!,
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// @override
// void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//   super.debugFillProperties(properties);
//   properties.add(DiagnosticsProperty('data', data));
// }
}
