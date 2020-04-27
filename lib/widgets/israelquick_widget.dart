import 'package:covid19_app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class IsraelquickWidget extends StatefulWidget {
  final Map data;
  IsraelquickWidget({Key key, @required this.data}) : super(key: key);
  @override
  _IsraelquickWidgetState createState() => _IsraelquickWidgetState();
}

class _IsraelquickWidgetState extends State<IsraelquickWidget> {

  @override
  Widget build(BuildContext context) {
    Map data = widget.data;
    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'וירוס קורונה בישראל',
                    style: TextStyle(fontSize: 28.0),
                  ),
                ]),
          ),
          Column(
            children: <Widget>[
              BoxWidget(
                label: 'מספר נדבקים נכון לעכשיו:',
                value: data['cases'],
                numberColor: Colors.grey[500],
                calc: null,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BoxWidget(
                label: 'מצב קל/בינוני:',
                value: (data['cases'] - data['serious_critical']),
                numberColor: Colors.lightBlue[500],
                calc: ((data['cases'] - data['serious_critical']) / data['cases'] * 100),
              ),
              BoxWidget(
                label: 'מצב קשה:',
                value: data['serious_critical'],
                numberColor: Colors.orange[600],
                calc: (data['serious_critical'] / data['cases'] * 100),
              ),
            ],
          ),
          Divider(
            height: 2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BoxWidget(
                label: 'החלימו:',
                value: data['total_recovered'],
                numberColor: Colors.green[600],
                calc: (data['total_recovered'] / (data['total_recovered'] + data['deaths']) * 100),
              ),
              BoxWidget(
                label: 'נפטרו:',
                value: data['deaths'],
                numberColor: Colors.red[700],
                calc: (data['deaths'] / (data['total_recovered'] + data['deaths']) * 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
