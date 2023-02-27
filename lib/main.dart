import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/menu.dart'; // ADD
import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://panedu.com.ng/app'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'http://panedu.neoaltus.com/wp-content/uploads/2023/01/download-removebg-preview.png',
          height: 50,
          width: 50,
        ),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller), // ADD
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
