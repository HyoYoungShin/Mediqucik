import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalReservationController extends GetxController {
  TextEditingController hospitalNameTextController = TextEditingController();
  TextEditingController reservationDayTextController = TextEditingController();
  TextEditingController reservationTimeTextController = TextEditingController();

  TextEditingController nameTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController telTextController = TextEditingController();
  TextEditingController visitingReasonTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

}
