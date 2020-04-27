import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:intl/intl.dart';

class NewChartWidget extends StatefulWidget {
  final List data;
  final String label;
  final String color; //'גרף חולים עולמי'
  NewChartWidget(
      {Key key,
      @required this.data,
      @required this.label,
      @required this.color})
      : super(key: key);
  @override
  _NewChartWidgetState createState() => _NewChartWidgetState(
      color: this.color, label: this.label, data: this.data);
}

class _NewChartWidgetState extends State<NewChartWidget> {
  final List data;
  final String label;
  final String color;
  _NewChartWidgetState(
      {Key key,
      @required this.data,
      @required this.label,
      @required this.color});

  var commaFormatter = new NumberFormat("#,###", "he_IL");

  @override
  Widget build(BuildContext context) {
    List<double> values = [];
    data.forEach((c) {
      values.add(double.parse(c['value'].toString()));
    });
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 18.0),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 150.0,
                child: Sparkline(
                  sharpCorners: false,
                  lineGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: this.color == 'lightcoral'
                        ? [Colors.red[800], Colors.red[200]]
                        : [Colors.blue[800], Colors.blue[200]],
                  ),
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: this.color == 'lightcoral'
                        ? [Colors.red[800], Colors.red[200]]
                        : [Colors.blue[800], Colors.blue[200]],
                  ),
                  pointsMode: PointsMode.all,
                  pointSize: 8.0,
                  pointColor: this.color == 'lightcoral'
                      ? Colors.red[900]
                      : Colors.blue[900],
                  data: label.indexOf('ישרא') == -1 ? values.reversed.toList() : values,
                ),
              ),
            ),
            label.indexOf('ישרא') == -1 ? 
            Row(
              children: <Widget>[
                Text(
                    '${commaFormatter.format(data[0]['value'])} \n ${data[0]['label'].toString()}'),
                Spacer(),
                Text(
                    '${commaFormatter.format(data[data.length - 1]['value'])} \n ${data[data.length - 1]['label'].toString()}'),
              ],
            )
             : Row(
              children: <Widget>[
                Text(
                    '${commaFormatter.format(data[data.length - 1]['value'])} \n ${data[data.length - 1]['label'].toString()}'),
                 Spacer(),
                Text(
                    '${commaFormatter.format(data[0]['value'])} \n ${data[0]['label'].toString()}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
