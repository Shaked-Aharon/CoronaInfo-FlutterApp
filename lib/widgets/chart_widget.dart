import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class ChartWidget extends StatefulWidget {
  final Map data;
  final String label;
  final String color; //'גרף חולים עולמי'
  ChartWidget({Key key, @required this.data, @required this.label, @required this.color}) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState(color:this.color,label: this.label,data: this.data);
}

class _ChartWidgetState extends State<ChartWidget> {
  final Map data;
  final String label;
  final String color;
  _ChartWidgetState({Key key, @required this.data, @required this.label, @required this.color});

  
  @override
  Widget build(BuildContext context) {
    // Map data;
    List<String> labels = [];
    List values = [];
    data.forEach((key, value) {
      // labels.add(key.toString().substring(0, 4));
      // String temp = key.toString().indexOf('-') == -1 ? key.toString().substring(0, 4) : key.toString().substring(4, 7);
      labels.add(key);
      values.add(value);
    });
    return Card(
      // margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
                    label,
                    style: TextStyle(fontSize: 18.0),
                  ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0.0),
                child: Echarts(
                  option: '''
    {
      xAxis: {
        type: 'category',
        data: $labels
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: $values,
        type: 'line',
        itemStyle: {
            color: '$color'
        }
      }]
    }
  ''',
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 300.0,
                margin: EdgeInsets.all(0.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
