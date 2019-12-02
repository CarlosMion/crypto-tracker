import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
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
          // leading:  CircleAvatar(
          //   backgroundColor: Colors.indigoAccent,
          //   child:  Text('$3'),
          //   foregroundColor: Colors.white,
          // ),
          title: title,
          subtitle: subtitle,
          trailing: trailling,
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => print('Deleted'),
        ),
      ],
    );
  }
}
