import 'package:covid19_app/widgets/chart_widget.dart';
import 'package:covid19_app/widgets/infectedmap_widget.dart';
import 'package:covid19_app/widgets/israelquick_widget.dart';
import 'package:covid19_app/widgets/newchart_widget.dart';
import 'package:covid19_app/widgets/piechart_widget.dart';
import 'package:covid19_app/widgets/quarantinemap_widget.dart';
import 'package:flutter/material.dart';

class ILPage extends StatefulWidget {
  Map data;
  ILPage({Key key, @required this.data}) : super(key: key);
  @override
  _ILPageState createState() => _ILPageState(data: {...this.data});
}

class _ILPageState extends State<ILPage> {
  Map data;
  _ILPageState({Key key, @required this.data});

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context).settings.arguments;
    Map current = arguments['current'];
    Map history = arguments['history'];
    Map casesSummary = {};
    Map deathsSummary = {};
    history['casesSummary'].forEach((obj) {
      casesSummary[obj[0]] = obj[1];
    });
    history['deathsSummary'].forEach((obj) {
      deathsSummary[obj[0]] = obj[1];
    });
    // Map data = {this.arguments['israel'] this.arguments['israelHistory']};
    // final israel = data['israel'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ישראל'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Column(
            children: <Widget>[
              IsraelquickWidget(
                data: current,
              ),
              PieChartWidget(
                critical: current['serious_critical'],
                deaths: current['deaths'],
                recovered: current['total_recovered'],
                rest: (current['cases'] - current['serious_critical']),
              ),
              // Center(
              //   child: ChartWidget(
              //     data: casesSummary,
              //     color: 'lightblue',
              //     label: 'גרף חולים בישראל',
              //   ),
              // ),
              NewChartWidget(
                  data: history['casesSummary2'],
                  color: 'lightblue',
                  label: 'גרף חולי בישראל',
                ),
                NewChartWidget(
                  data: history['deathsSummary2'],
                  color: 'lightcoral',
                  label: 'גרף תמותה בישראל',
                ),
              // Center(
              //   child: ChartWidget(
              //     data: deathsSummary,
              //     color: 'lightcoral',
              //     label: 'גרף תמותה בישראל',
              //   ),
              // ),
              
              Center(child: Text('מפת חולים', style: TextStyle(decoration: TextDecoration.underline, fontSize: 24.0),),),
              InfectedMapWidget(),
              Center(child: Text('מפת מבודדים', style: TextStyle(decoration: TextDecoration.underline, fontSize: 24.0),),),
              QuarantineMapWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
