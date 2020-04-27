import 'package:covid19_app/pages/contactus_page.dart';
import 'package:covid19_app/pages/directive_page.dart';
import 'package:covid19_app/pages/home_page.dart';
import 'package:covid19_app/pages/il_page.dart';
import 'package:covid19_app/pages/info_page.dart';
import 'package:covid19_app/pages/loading_page.dart';
import 'package:covid19_app/pages/policy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {   
  runApp(MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("he", "IL"),
      ],
      locale: Locale("he", "IL"),
      title: 'CoronaInfo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.lightBlue[900],
        primaryColor: Color.fromRGBO(0, 48, 96, 1.0),
        accentColor: Colors.indigo[50],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/il': (context) => ILPage(
          data: {},
        ),
        '/info': (context) => InfoPage(),
        '/directive': (context) => DirectivePage(),
        '/contactus': (context) => ContactusPage(),
        '/policy': (context) => PolicyPage(),
      },
    ));
}