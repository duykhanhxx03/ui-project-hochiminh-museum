import 'package:flutter/material.dart';
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
        title: const Text(
          "Bảo tàng 3D",
        ),
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
    super.dispose();
  }
}
