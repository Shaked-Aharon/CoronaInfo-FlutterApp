import 'package:flutter/material.dart';

class CardImageWidget extends StatelessWidget {
  final String imgName;
  CardImageWidget({this.imgName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         Center(child: Image(image:AssetImage('assets/$imgName'),),),
        ],
      ),
    );
  }
}