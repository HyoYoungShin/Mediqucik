import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediquick/component/hospital_record_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HospitalReservationRecord extends StatelessWidget {
  const HospitalReservationRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          '병원예약 기록',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                //hospital reservation record list
                HospitalRecordList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
