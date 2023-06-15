import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/component/hospital_component.dart';
import 'package:mediquick/component/top_search_bar.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        TopSearchBar(),
        SizedBox(
          height: 15.0,
        ),
        //provide hospitals for reservation
        HospitalList(),
      ],
    );
  }
}

class HospitalList extends StatelessWidget {
  const HospitalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //hospital information
        //click hospital component to make reservation
        HospitalComponent(
            hospitalName: '성남 정병원',
            hospitalTel: '031-750-6000',
            hospitalAddress: '경기도 성남시 수정구 수정로 76 지하3층~10층'),
        SizedBox(
          height: 15.0,
        ),
        HospitalComponent(
            hospitalName: '이메디의원',
            hospitalTel: '031-756-9988',
            hospitalAddress: '경기 성남시 수정구 남문로 66'),
        SizedBox(
          height: 15.0,
        ),
        HospitalComponent(
            hospitalName: '성남시의료원',
            hospitalTel: '031-738-7000',
            hospitalAddress: '경기 성남시 수정로 171번길 10 (태평동)'),
        SizedBox(
          height: 15.0,
        ),
        HospitalComponent(
            hospitalName: '지우병원',
            hospitalTel: '1544-6686',
            hospitalAddress: '경기 성남시 수정구 수정로 183 (태평동)'),
      ],
    );
  }
}
