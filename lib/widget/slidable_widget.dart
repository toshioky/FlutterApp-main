import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction { delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.amber[300],
            icon: Icons.delete,
            onTap: () => _showDialog(context),
          ),
        ],
      );

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String topText = '削除';
          String contentText = '該当するアイテムを削除します。\nよろしいでしょうか？';
          String degree = 'いいえ';
          String agree = 'はい';

          return AlertDialog(
            backgroundColor: Colors.orange.shade100,
            title: Text(topText,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold)),
            content: Text(contentText),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    degree,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold),
                  )),
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () => deleteData(context),
                  child: Text(
                    agree,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          );
        });
  }

  void deleteData(BuildContext context) {
    onDismissed(SlidableAction.delete);
    Navigator.of(context).pop();
  }
}
