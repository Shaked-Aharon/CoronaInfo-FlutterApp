import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TableRowWidget extends StatelessWidget {
  final commaFormatter = new NumberFormat("#,###", "he_IL");
  double doubleFormatter(double n) {
    return double.parse(n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2));
  }

  final int rank;
  final String countryCode;
  final String countryName;
  final String hebName;
  final int cases;
  final int newCases;
  final int deaths;
  final int newDeaths;
  final int recovered;
  final int critical;
  final double prec;

  TableRowWidget({
    @required this.rank,
    @required this.countryCode,
    @required this.countryName,
    @required this.hebName,
    @required this.cases,
    @required this.newCases,
    @required this.deaths,
    @required this.newDeaths,
    @required this.recovered,
    @required this.critical,
    @required this.prec,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: rank % 2 == 0 ? Colors.grey[200] : Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  color: hebName != 'ישראל'
                      ? rank % 2 == 0 ? Colors.grey[200] : Colors.white
                      : Colors.lightBlue[200]),
              child: Center(
                child: Text("$rank", style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: (countryCode != null ? Image.network('https://www.countryflags.io/$countryCode/shiny/32.png') : Text('0')),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text('${hebName != null ? hebName : ''}', style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text(
                    '${cases != null ? commaFormatter.format(cases) : cases}',
                    style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  color: newCases == 0 || newCases == null
                      ? rank % 2 == 0 ? Colors.grey[200] : Colors.white
                      : Colors.orange[300]),
              height: 50.0,
              // decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text(
                    '${(newCases != null && newCases != 0) ? commaFormatter.format(newCases) : ''}',
                    style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text(
                    '${deaths != null ? commaFormatter.format(deaths) : deaths}',
                    style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  color: newDeaths == 0 || newDeaths == null
                      ? rank % 2 == 0 ? Colors.grey[200] : Colors.white
                      : Colors.red[400]),
              child: Center(
                child: Text(
                    '${!(newDeaths != null && newDeaths == 0) ? commaFormatter.format(newDeaths) : ''}',
                    style: TextStyle(fontSize: 10.0, color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text(
                    '${recovered != null ? commaFormatter.format(recovered) : ''}',
                    style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text(
                    '${critical != null ? commaFormatter.format(critical) : ''}',
                    style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              child: Center(
                child: Text('${prec != null ? doubleFormatter(prec) : 'NaN'}%',
                    style: TextStyle(fontSize: 10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
