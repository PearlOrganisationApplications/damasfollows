import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  WebViewController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith("mailto:") ||
                request.url.startsWith("tel:") ||
                request.url.startsWith("whatsapp:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controllerCompleter.future.then((value) => _controller = value);
            _controllerCompleter.complete(webViewController);
          },
          initialUrl: 'https://test.pearl-developer.com/dexter/public/contact',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
