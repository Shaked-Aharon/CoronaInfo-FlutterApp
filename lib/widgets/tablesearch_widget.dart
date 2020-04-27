import 'package:flutter/material.dart';

class TableSearchWidget extends StatefulWidget {
  final searchTable;
  TableSearchWidget({this.searchTable});

  @override
  _TableSearchWidgetState createState() =>
      _TableSearchWidgetState(searchTable: searchTable);
}

class _TableSearchWidgetState extends State<TableSearchWidget> {
  final searchTable;
  _TableSearchWidgetState({
    @required this.searchTable,
  });

  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    // searchTable('ישראל');
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
            decoration: InputDecoration(labelText: 'שם המדינה',),
          ),
        ),
        Expanded(
          flex: 0,
          child: RaisedButton.icon(
            onPressed: () {
              searchTable(searchValue);
            },
            icon: Icon(Icons.search),
            label: Text('חפש'),
          ),
        ),
        Expanded(
          flex: 0,
          child: RaisedButton(
            onPressed: () {
              searchTable('');
            },
            child: Icon(Icons.close),
          ),
          // RaisedButton.icon(
          //   onPressed: () {
          //     searchTable('');
          //   },
          //   icon: Icon(Icons.close),
          //   label: SizedBox.shrink(),
          // ),
        ),
      ],
    );
  }
}
