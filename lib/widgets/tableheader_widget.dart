import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TableHeaderWidget extends StatefulWidget {
  final createTableOrderBy;
  TableHeaderWidget({this.createTableOrderBy});

  @override
  _TableHeaderWidgetState createState() =>
      _TableHeaderWidgetState(createTableOrderBy: createTableOrderBy);
}

class _TableHeaderWidgetState extends State<TableHeaderWidget> {
  final commaFormatter = new NumberFormat("#,###", "he_IL");

  final createTableOrderBy;
  bool isAsec = true;
  String sortBy = '';
  _TableHeaderWidgetState({
    @required this.createTableOrderBy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 50.0,
            color: Colors.black,
            child: Center(
              child: Text("#",
                  style: TextStyle(color: Colors.white, fontSize: 9.5)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 50.0,
            color: Colors.black,
            child: Center(
              child: Text("דגל",
                  style: TextStyle(color: Colors.white, fontSize: 9.5)),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 50.0,
            color: Colors.black,
            child: Center(
              child: Text("מדינה",
                  style: TextStyle(color: Colors.white, fontSize: 9.5)),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('casesDown')
                  : createTableOrderBy('casesUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'cases'
                  : 'cases';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "חולים",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'cases' ? WidgetSpan(
                        child: Icon(!isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('newCasesDown')
                  : createTableOrderBy('newCasesUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'newCases'
                  : 'newCases';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "היום",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'newCases' ? WidgetSpan(
                        child: Icon(!isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white,),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('deathsDown')
                  : createTableOrderBy('deathsUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'deaths'
                  : 'deaths';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "נפרט",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'deaths' ? WidgetSpan(
                        child: Icon(!isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white,),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('newDeathsDown')
                  : createTableOrderBy('newDeathsUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'newDeaths'
                  : 'newDeaths';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "היום",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'newDeaths' ? WidgetSpan(
                        child: Icon(!isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white,),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('recoveredDown')
                  : createTableOrderBy('recoveredUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'recovered'
                  : 'recovered';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "החלימו",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'recovered' ? WidgetSpan(
                        child: Icon(!isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white,),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('criticalDown')
                  : createTableOrderBy('criticalUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'critical'
                  : 'critical';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "במצב קשה",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'critical' ? WidgetSpan(
                        child: Icon(!isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white,),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              isAsec
                  ? createTableOrderBy('precDown')
                  : createTableOrderBy('precUp');
              setState(() {
                isAsec = !isAsec;
                sortBy = isAsec
                  ? 'prec'
                  : 'prec';
              });
            },
            child: Container(
              height: 50.0,
              color: Colors.black,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "אחוז הנדבקים",
                          style:
                              TextStyle(color: Colors.white, fontSize: 9.5)),
                      sortBy == 'prec' ? WidgetSpan(
                        child: Icon(isAsec ? Icons.arrow_downward : Icons.arrow_upward, color: Colors.white,),
                      ) : TextSpan(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
