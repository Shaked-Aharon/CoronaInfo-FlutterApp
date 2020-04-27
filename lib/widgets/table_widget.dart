import 'package:covid19_app/widgets/tableheader_widget.dart';
import 'package:covid19_app/widgets/tablerow_widget.dart';
import 'package:covid19_app/widgets/tablesearch_widget.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  final List data;
  TableWidget({Key key, @required this.data}) : super(key: key);
  @override
  _TableWidgetState createState() => _TableWidgetState(data: this.data);
}

class _TableWidgetState extends State<TableWidget> {
  final List data;
  _TableWidgetState({Key key, @required this.data});
  List<Widget> columns = [];
  String orderBy = 'casesDown';
  @override
  void initState() {
    super.initState();
    createTable();
  }

  List sortTable(orderBy) {
    List temp = data;
    switch (orderBy) {
      case 'casesDown':
        temp.sort((a, b) {
          if (a['cases'] == null) return 1;
          if (b['cases'] == null) return 0;
          return b['cases'].compareTo(a['cases']);
        });
        break;
      case 'casesUp':
        temp.sort((a, b) {
          if (a['cases'] == null) return 1;
          if (b['cases'] == null) return 0;
          return a['cases'].compareTo(b['cases']);
        });
        break;
      case 'newCasesDown':
        temp.sort((a, b) {
          if (a['new_cases'] == null) return 1;
          if (b['new_cases'] == null) return 0;
          return b['new_cases'].compareTo(a['new_cases']);
        });
        break;
      case 'newCasesUp':
        temp.sort((a, b) {
          if (a['new_cases'] == null) return 1;
          if (b['new_cases'] == null) return 0;
          return a['new_cases'].compareTo(b['new_cases']);
        });
        break;
      case 'deathsDown':
        temp.sort((a, b) {
          if (a['deaths'] == null) return 1;
          if (b['deaths'] == null) return 0;
          return b['deaths'].compareTo(a['deaths']);
        });
        break;
      case 'deathsUp':
        temp.sort((a, b) {
          if (a['deaths'] == null) return 1;
          if (b['deaths'] == null) return 0;
          return a['deaths'].compareTo(b['deaths']);
        });
        break;
      case 'newDeathsDown':
        temp.sort((a, b) {
          if (a['new_deaths'] == null) return 1;
          if (b['new_deaths'] == null) return 0;
          return b['new_deaths'].compareTo(a['new_deaths']);
        });
        break;
      case 'newDeathsUp':
        temp.sort((a, b) {
          if (a['new_deaths'] == null) return 1;
          if (b['new_deaths'] == null) return 0;
          return a['new_deaths'].compareTo(b['new_deaths']);
        });
        break;
      case 'recoveredDown':
        temp.sort((a, b) {
          if (a['total_recovered'] == null) return 1;
          if (b['total_recovered'] == null) return 0;
          if (a['total_recovered'] == null) return 1;
          if (b['total_recovered'] == null) return 0;
          return b['total_recovered'].compareTo(a['total_recovered']);
        });
        break;
      case 'recoveredUp':
        temp.sort((a, b) {
          if (a['total_recovered'] == null) return 1;
          if (b['total_recovered'] == null) return 0;
          return a['total_recovered'].compareTo(b['total_recovered']);
        });
        break;
      case 'criticalDown':
        temp.sort((a, b) {
          if (a['serious_critical'] == null) return 1;
          if (b['serious_critical'] == null) return 0;
          return b['serious_critical'].compareTo(a['serious_critical']);
        });
        break;
      case 'criticalUp':
        temp.sort((a, b) {
          if (a['serious_critical'] == null) return 1;
          if (b['serious_critical'] == null) return 0;
          return a['serious_critical'].compareTo(b['serious_critical']);
        });
        break;
      case 'precDown':
        temp.sort((a, b) {
          if (a['population'] == null) return 1;
          if (b['population'] == null) return 0;
          return (a['cases'] / a['population'] * 100)
              .compareTo((b['cases'] / b['population'] * 100));
        });
        break;
      case 'precUp':
        temp.sort((a, b) {
          if (a['population'] == null) return 1;
          if (b['population'] == null) return 0;
          return (b['cases'] / b['population'] * 100)
              .compareTo((a['cases'] / a['population'] * 100));
        });
        break;
    }
    return temp;
  }

  void createTable() {
    List tableData = sortTable(this.orderBy);
    List<Widget> temp = [];
    for (var i = 0; i < tableData.length; i++) {
      // if(tableData[i]['country_name'].toString().indexOf())
      temp.add(TableRowWidget(
        cases: tableData[i]['cases'] != null ? tableData[i]['cases'] : null,
        countryCode: tableData[i]['country_code'] != null
            ? tableData[i]['country_code'].toString()
            : null,
        countryName: tableData[i]['country_name'] != null
            ? tableData[i]['country_name'].toString()
            : null,
        critical: tableData[i]['serious_critical'] != null
            ? tableData[i]['serious_critical']
            : null,
        deaths: tableData[i]['deaths'] != null ? tableData[i]['deaths'] : null,
        newDeaths: tableData[i]['new_deaths'] != null
            ? tableData[i]['new_deaths']
            : null,
        hebName: tableData[i]['heb_name'] != null
            ? tableData[i]['heb_name'].toString()
            : null,
        newCases: tableData[i]['new_cases'] != null
            ? tableData[i]['new_cases']
            : null,
        rank: tableData.indexOf(tableData[i]) + 1,
        prec: tableData[i]['population'] != null
            ? (tableData[i]['cases'] / tableData[i]['population'] * 100)
            : null,
        recovered: tableData[i]['total_recovered'] != null
            ? tableData[i]['total_recovered']
            : null,
      ));
      setState(() {
        columns = temp;
      });
    }
  }

  void setOrderBy(newOrderBy) {
    setState(() {
      orderBy = newOrderBy;
    });
    createTable();
  }

  void searchTable(String value) {
    List tableData = sortTable(this.orderBy);
    List<Widget> temp = [];
    for (var i = 0; i < tableData.length; i++) {
      if (tableData[i]['country_name'].indexOf(value) != -1 || tableData[i]['heb_name'].indexOf(value) != -1) {
        temp.add(TableRowWidget(
          cases: tableData[i]['cases'] != null ? tableData[i]['cases'] : null,
          countryCode: tableData[i]['country_code'] != null
              ? tableData[i]['country_code'].toString()
              : null,
          countryName: tableData[i]['country_name'] != null
              ? tableData[i]['country_name'].toString()
              : null,
          critical: tableData[i]['serious_critical'] != null
              ? tableData[i]['serious_critical']
              : null,
          deaths:
              tableData[i]['deaths'] != null ? tableData[i]['deaths'] : null,
          newDeaths: tableData[i]['new_deaths'] != null
              ? tableData[i]['new_deaths']
              : null,
          hebName: tableData[i]['heb_name'] != null
              ? tableData[i]['heb_name'].toString()
              : null,
          newCases: tableData[i]['new_cases'] != null
              ? tableData[i]['new_cases']
              : null,
          rank: tableData.indexOf(tableData[i]) + 1,
          prec: tableData[i]['population'] != null
              ? (tableData[i]['cases'] / tableData[i]['population'] * 100)
              : null,
          recovered: tableData[i]['total_recovered'] != null
              ? tableData[i]['total_recovered']
              : null,
        ));
      }
      setState(() {
        columns = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TableSearchWidget(searchTable: this.searchTable,),
        TableHeaderWidget(
          createTableOrderBy: this.setOrderBy,
        ),
        // SingleChildScrollView(
        //   child: Container(
        //     height: 500.0,
        //     child: Column(
        //       children: columns.toList(),
        //     ),
        //   ),
        // ),
        // columns[0],
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: columns.toList(),
            ),
          ),
        ),
      ],
    );
  }
}
