import 'dart:async';

import 'package:covid19_app/models/menuitem_model.dart';
import 'package:covid19_app/widgets/chart_widget.dart';
import 'package:covid19_app/widgets/closedcases_widget.dart';
import 'package:covid19_app/widgets/israelquick_widget.dart';
import 'package:covid19_app/widgets/newchart_widget.dart';
import 'package:covid19_app/widgets/opencases_widget.dart';
import 'package:covid19_app/widgets/table_widget.dart';
import 'package:covid19_app/widgets/worldquick_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  void initState() {
    super.initState();
    // Timer.periodic(
    //     new Duration(
    //       minutes: 1,
    //     ), (timer) {
    //   Map arguments = ModalRoute.of(context).settings.arguments;
    //   dynamic instance = arguments['instance'];
    //   instance.getData();
    //   setState(() {
    //     data = instance.data;
    //   });
    // });
  }

  Future<Null> refreshData() async {
    Map arguments = ModalRoute.of(context).settings.arguments;
    dynamic instance = arguments['instance'];
    await instance.getData();
    setState(() {
      data = instance.data;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    dynamic instance = arguments['instance'];
    data = data.isNotEmpty ? data : instance.data;
    final Map send = {
      'current': this.data['israel'],
      'history': this.data['israelHistory']
    };
    List<Widget> menuItems = [];
    for (var i = 0; i < (menu.length + 2); i++) {
      if (i == menu.length) {
        menuItems.add(Spacer());
        continue;
      }
      if (i == menu.length + 1) {
        menuItems.add(GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/policy');
          },
          child: ListTile(
            title: Text('תקנון שימוש'),
            leading: Icon(Icons.announcement),
            trailing: Icon(Icons.keyboard_arrow_left),
          ),
        ));
        continue;
      }
      menuItems.add(GestureDetector(
        onTap: () {
          menu[i].to == 'il' && this.data != null
              ? Navigator.pushNamed(
                  context,
                  '/${menu[i].to}',
                  arguments: send,
                )
              : Navigator.pushNamed(context, '/${menu[i].to}');
        },
        child: ListTile(
          title: menu[i].title,
          leading: menu[i].leading,
          trailing: menu[i].trailing,
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: 64,
        ),
        elevation: 2.0,
      ),
      backgroundColor: Theme.of(context).accentColor,
      drawer: Drawer(
        elevation: 0.0,
        child: SafeArea(
          child: Column(
            children: menuItems.toList(),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Column(
              children: <Widget>[
                IsraelquickWidget(
                  data: data['israel'],
                ),
                WorldquickWidget(
                  data: data['totalStats'],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Text(
                    'מעקב נדבקים עולמי',
                    style: TextStyle(
                        fontSize: 24.0, decoration: TextDecoration.underline),
                  ),
                ),
                ClosedCasesWidget(
                  deaths: data['totalStats']['total_deaths'],
                  recovered: data['totalStats']['total_recovered'],
                  total: data['totalStats']['total_cases'],
                ),
                OpenCasesWidget(
                  total: data['totalStats']['total_cases'],
                  critical: data['totalStats']['serious_critical'],
                  rest: (data['totalStats']['total_cases'] -
                      data['totalStats']['serious_critical']),
                ),
                // Center(
                //   child: ChartWidget(
                //     data: data['casesSummary'],
                //     color: 'lightblue',
                //     label: 'גרף חולים עולמי',
                //   ),
                // ),
                // Center(
                //   child: ChartWidget(
                //     data: data['deathsSummary'],
                //     color: 'lightcoral',
                //     label: 'גרף תמותה עולמי',
                //   ),
                // ),
                NewChartWidget(
                  data: data['summary']['cases'],
                  color: 'lightblue',
                  label: 'גרף חולי חודשי',
                ),
                NewChartWidget(
                  data: data['summary']['deaths'],
                  color: 'lightcoral',
                  label: 'גרף תמותה חודשי',
                ),
                // WorldTableWidget(data: data['allCountries'],),
                TableWidget(data: data['allCountries']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
