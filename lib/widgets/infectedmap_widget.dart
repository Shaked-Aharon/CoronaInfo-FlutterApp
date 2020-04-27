import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfectedMapWidget extends StatefulWidget {
  @override
  _InfectedMapWidgetState createState() => _InfectedMapWidgetState();
}

class _InfectedMapWidgetState extends State<InfectedMapWidget> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
        elevation: 3.0,
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://gis.health.gov.il/CoronaExposure/',
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
