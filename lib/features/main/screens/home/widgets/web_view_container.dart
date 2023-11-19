import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ui_project_hochiminh_museum/app.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  const WebViewContainer({super.key, required this.url});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {

  /// Initialize webview
  // final controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // ..loadRequest(Uri.parse('https://demo-map.vietnaminfo.net/tours/bthcm'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bảo tàng 3D"),
        backgroundColor: Colors.red,
      ),
      body: WebViewWidget(
        controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url)),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
