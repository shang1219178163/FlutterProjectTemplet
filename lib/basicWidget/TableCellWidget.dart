import 'package:flutter/material.dart';

class TableCellWidget extends StatelessWidget {
  final data;

  const TableCellWidget({
    Key? key,
    this.data,
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
            child: Image.network(
              data.imageUrl,
              width: 40,
              height: 40,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Text(
                      data.time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF999999),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 2)),
                Text(
                  data.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF999999),
                  ),
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
