import 'package:covid19_app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class ClosedCasesWidget extends StatefulWidget {
  final int total;
  final int recovered;
  final int deaths;
  ClosedCasesWidget(
      {Key key,
      @required this.total,
      @required this.recovered,
      @required this.deaths})
      : super(key: key);
  @override
  _ClosedCasesWidgetState createState() => _ClosedCasesWidgetState();
}

class _ClosedCasesWidgetState extends State<ClosedCasesWidget> {
  @override
  Widget build(BuildContext context) {
    final int total = widget.total;
    final int recovered = widget.recovered;
    final int deaths = widget.deaths;
    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'מקרים סגורים',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
          Column(
            children: <Widget>[
              BoxWidget(
                label: '',
                value: deaths + recovered,
                numberColor: Colors.grey[500],
                calc: null,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BoxWidget(
                label: 'החלימו',
                value: recovered,
                numberColor: Colors.green[600],
                calc: recovered / total * 100,
              ),
              BoxWidget(
                label: 'נפטרו:',
                value: deaths,
                numberColor: Colors.red[700],
                calc: deaths / total * 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
