import 'package:flutter/material.dart';
import 'package:fluttertemplet/dartExpand/DDLog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:styled_widget/styled_widget.dart';


class ThirdPage extends StatefulWidget {

  final String? title;
  ThirdPage({ Key? key, this.title}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  final items = List<String>.generate(20, (i) => 'Item ${i}');

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            // leading: Icon(Icons.backspace_outlined)
            // // .gestures(onTap: ()=> DDLog("back")
            //     .gestures(onTap: (){ Navigator.pop(context); }),
            title: Text(widget.title ?? "$widget"),
          ),
          body: buildListView(context),
    );
  }


  Widget buildListView(BuildContext context) {

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
          key: Key(item),
          child: ListTile(title: Text("$item"),
            selected: (selectedIndex == index),
            trailing: selectedIndex == index ? Icon(Icons.check) : null,
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
              DDLog([selectedIndex, index]);
            }
            ,
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            if (direction == DismissDirection.startToEnd) {
              DDLog("Add to favorite");
            } else {
              DDLog('Remove item');
            }
          },
          background: buildFavorite(context),
          secondaryBackground: buildDelete(context),
          confirmDismiss: (DismissDirection direction) async {
              return buildConfirmDismiss(context);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          indent: 15,
          endIndent: 15,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }


  Widget buildFavorite(BuildContext context) {
    return
      Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.favorite, color: Colors.white),
              Text('Move to favorites', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      );
  }

  Widget buildDelete(BuildContext context) {
    return
    Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
            Text('Move to trash', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Future<bool?> buildConfirmDismiss(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Delete")
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}