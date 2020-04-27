import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BoxWidget extends StatefulWidget {
  final Color numberColor;
  final String label;
  final int value;
  final double calc;
  BoxWidget({Key key, @required this.numberColor, @required this.label, @required this.value, @required this.calc}) : super(key: key);
  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  final commaFormatter = new NumberFormat("#,###", "he_IL");

  double doubleFormatter(double n) {
  return double.parse(n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2));
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.label, style: TextStyle(fontSize: 24.0),),
        Text(commaFormatter.format(widget.value), style: TextStyle(fontSize: 36.0, color: widget.numberColor, fontWeight: FontWeight.bold)),
        widget.calc != null ? Text('(${doubleFormatter(widget.calc)}%)') : SizedBox.shrink(),
        SizedBox(height: 5.0,)
      ],
    );
  }
}
