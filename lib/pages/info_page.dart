import 'package:covid19_app/widgets/cardimage_widget.dart';
import 'package:covid19_app/widgets/whatis_widget.dart';
import 'package:covid19_app/widgets/symptoms_widget.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('מידע ותסמינים'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Column(
            children: <Widget>[WhatIsWidget(),SymptomsWidget(),CardImageWidget(imgName: 'symptoms.png',), CardImageWidget(imgName: 'covid-serviving.jpg',)],
          ),
        ),
      ),
    );
  }
}
