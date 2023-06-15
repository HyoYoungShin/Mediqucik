import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/component/topmenu_bar/topmenu_bar.dart';
import 'package:mediquick/screen/hamburger_button.dart';
import 'package:mediquick/screen/main_screen/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return Scaffold(
      appBar: AppBar(
        //title is changed on the clicked icon in topMenuBar
        title: Obx(() => Text(controller.appBarText.value, style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: HamburgerButton(),
      body: Column(
        children: [
          TopMenuBar(),
          //pages is changed on the clicked icon in topMenuBar
          Obx(
            () => Expanded(
              child: controller.pages[controller.pageIndex.value],
            ),
          ),
        ],
      ),
    );
  }
}
