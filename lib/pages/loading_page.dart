import 'package:covid19_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void setupInitData() async {
    ApiService instance = ApiService();
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'instance': instance
    });

  }


  @override
  void initState() {
    super.initState();
    setupInitData();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        minimum: EdgeInsets.only(top: size),
        child: Column(children: <Widget>[ 
          Center(
            child:Image.asset("assets/logo.png"),),
          SpinKitCircle(
          size: 80.0,
          color: Colors.white,
        ),
        ],)
      ),
    );
  }
}
