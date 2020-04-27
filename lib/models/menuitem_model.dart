import 'package:flutter/material.dart';

class MenuItem {
  Widget title;
  Widget leading;
  Widget trailing;
  String to;

  MenuItem({
    this.title,
    this.leading,
    this.trailing,
    this.to,
  });
}

final List<MenuItem> menu = [
    MenuItem(
      title: Text("ישראל"),
      leading: Icon(Icons.flag),
      trailing: Icon(Icons.keyboard_arrow_left),
      to: 'il'
    ),
    MenuItem(
      title: Text("מידע ותסמינים"),
      leading: Icon(Icons.info),
      trailing: Icon(Icons.keyboard_arrow_left),
      to: 'info'
    ),
    MenuItem(
      title: Text("הנחיות"),
      leading: Icon(Icons.directions),
      trailing: Icon(Icons.keyboard_arrow_left),
      to: 'directive'
    ),
    MenuItem(
      title: Text("יצירת קשר לספקים"),
      leading: Icon(Icons.contacts),
      trailing: Icon(Icons.keyboard_arrow_left),
      to: 'contactus'
    ),
  ];