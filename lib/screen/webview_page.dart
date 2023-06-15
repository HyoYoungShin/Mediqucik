import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/const/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebviewPage extends StatelessWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Get.arguments; //get webview Url
    return Scaffold(
      appBar: AppBar(
        title: Text('정보 공유'),
        backgroundColor: MAIN_BLUE_GREEN_COLOR,
      ),
      body: WebView(
        initialUrl: value, //display webview
      ),
    );
  }
}
