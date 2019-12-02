import '../util/async_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget subtitle;
  final Widget trailling;

  SlidableListTile({this.leading, this.title, this.subtitle, this.trailling});

  Widget build(context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: subtitle,
          trailing: trailling,
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => AsyncStorage.removeCryptoCurrency(title.toLowerCase()),
        ),
      ],
    );
  }
}
