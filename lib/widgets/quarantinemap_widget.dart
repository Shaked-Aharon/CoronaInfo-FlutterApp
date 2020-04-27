import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuarantineMapWidget extends StatefulWidget {
  @override
  _QuarantineMapWidgetState createState() => _QuarantineMapWidgetState();
}

class _QuarantineMapWidgetState extends State<QuarantineMapWidget> {
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
            initialUrl: 'https://imoh.maps.arcgis.com/apps/webappviewer/index.html?id=66b5c304a3114df89ef5cfc8e8b12eb2&locale=he&',
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
