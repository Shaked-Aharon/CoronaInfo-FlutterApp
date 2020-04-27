import 'package:covid19_app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class WorldquickWidget extends StatefulWidget {
  final Map data;
  WorldquickWidget({Key key, @required this.data}) : super(key: key);
  @override
  _WorldquickWidgetState createState() => _WorldquickWidgetState();
}

class _WorldquickWidgetState extends State<WorldquickWidget> {
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
                    'וירוס קורונה בעולם',
                    style: TextStyle(fontSize: 28.0),
                  ),
                ]),
          ),
          Column(
            children: <Widget>[
              BoxWidget(
                label: 'מספר נדבקים נכון לעכשיו:',
                value: data['total_cases'],
                numberColor: Colors.grey[500],
                calc: null,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BoxWidget(
                label: 'החלימו:',
                value: data['total_recovered'],
                numberColor: Colors.green[600],
                calc: null,
              ),
              BoxWidget(
                label: 'נפטרו:',
                value: data['total_deaths'],
                numberColor: Colors.red[700],
                calc: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
