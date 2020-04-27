import 'package:flutter/material.dart';

class CardBasicWidget extends StatelessWidget {
  final String title;
  final String content;
  CardBasicWidget({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                '$title',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 24.0),
              ),
            ),
            Text("""
$content         """),
          ],
        ),
      ),
    );
  }
}
