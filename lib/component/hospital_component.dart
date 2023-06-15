import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/screen/hospital_reservation/hospital_reservation_screen.dart';

class HospitalComponent extends StatelessWidget {
  final String hospitalName;
  final String hospitalTel;
  final String hospitalAddress;

  const HospitalComponent({
    required this.hospitalName,
    required this.hospitalTel,
    required this.hospitalAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //detect the click of hospital component & route to hospital reservation
    return GestureDetector(
      onTap: () {
        Get.offAll(() => HospitalReservationScreen());
      },
      child: Container(
        width: Get.width - 20,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xffF9F9ff),
          border: Border.all(
            width: 1,
            color: Color(0xffb3b5b4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //hospital Name
              Text(
                hospitalName,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              //hosptial telephone number
              Text(hospitalTel),
              SizedBox(
                height: 5.0,
              ),
              //hpospital address
              Text(hospitalAddress),
            ],
          ),
        ),
      ),
    );
  }
}
