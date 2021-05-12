import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class TextlessPage extends StatefulWidget {
  TextlessPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _TextlessPageState createState() => _TextlessPageState();
}

class _TextlessPageState extends State<TextlessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: "TextLess".toUpperCase().h5.letterSpacing(15).light,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // "Headline1".h1.overflowFade,
            "Headline2".h2.overflowFade,
            "Headline3".h3,
            "Headline4".h4,
            "Headline5".h5,
            "Headline6".h6,
            "Subtitle1".s1,
            "Subtitle1".s2,
            "BodyText1".b1,
            "BodyText2".style(TextStyle(color: Colors.red)),
            "Button".btn,
            "Caption".cap,
            "Overline".ol,
          ],
        ),
      ),
    );
  }
}
