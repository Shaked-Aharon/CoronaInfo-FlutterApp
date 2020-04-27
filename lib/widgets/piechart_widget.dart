import 'package:covid19_app/widgets/box_widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatefulWidget {
  final int rest;
  final int critical;
  final int recovered;
  final int deaths;
  PieChartWidget({Key key, @required this.rest, @required this.critical, @required this.recovered, @required this.deaths}) : super(key: key);
  @override
  _PieChartWidgetState createState() => _PieChartWidgetState(deaths: this.deaths, critical: this.critical, recovered: this.recovered, rest: this.rest);
}

class _PieChartWidgetState extends State<PieChartWidget> {
  final int rest;
  final int critical;
  final int recovered;
  final int deaths;
  _PieChartWidgetState({Key key, @required this.rest, @required this.critical, @required this.recovered, @required this.deaths});

  @override
  Widget build(BuildContext context) {
    print(rest);
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("red", () => double.parse(deaths.toString()));
    dataMap.putIfAbsent("blue", () => double.parse(rest.toString()));
    dataMap.putIfAbsent("green", () => double.parse(recovered.toString()));
    dataMap.putIfAbsent("yelloew", () => double.parse(critical.toString()));
    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BoxWidget(label: 'מספר מקרי קורונה עד כה:', value: (recovered + deaths + rest + critical), calc: null, numberColor: Colors.black,),
          PieChart(
            dataMap: dataMap,
            chartType: ChartType.disc,
            showChartValuesOutside: false,
            showLegends: false,
          ),
        ],
      ),
    );
  }
}
