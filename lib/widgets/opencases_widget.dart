import 'package:covid19_app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class OpenCasesWidget extends StatefulWidget {
  final int total;
  final int rest;
  final int critical;
  OpenCasesWidget(
      {Key key,
      @required this.total,
      @required this.rest,
      @required this.critical})
      : super(key: key);
  @override
  _OpenCasesWidgetState createState() => _OpenCasesWidgetState();
}

class _OpenCasesWidgetState extends State<OpenCasesWidget> {
  @override
  Widget build(BuildContext context) {
    final int total = widget.total;
    final int rest = widget.rest;
    final int critical = widget.critical;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0),
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
                    'מקרים פתוחים',
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
                value: rest + critical,
                numberColor: Colors.grey[500],
                calc: null,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BoxWidget(
                label: 'במצב קל/בינוני',
                value: rest,
                numberColor: Colors.lightBlue[500],
                calc: rest / total * 100,
              ),
              BoxWidget(
                label: 'במצב קשה:',
                value: critical,
                numberColor: Colors.orange[600],
                calc: critical / total * 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
