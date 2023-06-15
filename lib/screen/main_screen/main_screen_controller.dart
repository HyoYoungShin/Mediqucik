import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mediquick/screen/hospital_screen.dart';
import 'package:mediquick/screen/review_screen.dart';
import 'package:mediquick/screen/tip_screen.dart';

class MainScreenController extends GetxController {
  //Rx is for state management

  //title able to change
  RxString appBarText = "병원 예약".obs;

  //put pages in the Rxlist
  RxList<Widget> pages = RxList();
  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    //add screens to RxList
    pages.add(HospitalScreen()); //hospital screen
    pages.add(ReviewScreen()); //review screen
    pages.add(TipScreen()); //tip screen
    super.onInit();
  }
}
