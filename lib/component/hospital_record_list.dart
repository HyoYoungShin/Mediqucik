import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediquick/component/hospital_record_component.dart';
import 'package:mediquick/providers/reservation_documentId_provider.dart';
import 'package:provider/provider.dart';

class HospitalRecordList extends StatelessWidget {
  const HospitalRecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetching the documentId from the ReservationDocumentIdProvider
    final documentId =
        Provider.of<ReservationDocumentIdProvider>(context).documentId;

    return SingleChildScrollView(
      child: Column(
        children: [
          // A FutureBuilder is used to interact with Firestore
          FutureBuilder<DocumentSnapshot?>(
            // Checking if the documentId is not equal to 'defaultvalueofId'
            future: documentId != 'defaultvalueofId'
                // If not, fetch the document from Firestore collection 'Hospital_Reservation' with the documentId
                ? FirebaseFirestore.instance
                    .collection('Hospital_Reservation')
                    .doc(documentId)
                    .get()
                    .then((snapshot) => snapshot)
                // If documentId is equal to 'defaultvalueofId', return null
                : null,
            // The builder then checks the state of the future
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot?> snapshot) {
              // Check if the documentId is 'defaultvalueofId', or if the connection is not yet done, or if the data is null or if the document does not exist
              // If any of these conditions are true, return a default HospitalRecordComponent
              if (documentId == 'defaultvalueofId' ||
                  snapshot.connectionState != ConnectionState.done ||
                  snapshot.data == null ||
                  !snapshot.data!.exists) {
                return HospitalRecordComponent(
                  // Default data
                  hospitalName: '정병원',
                  reservationDay: '2023.05.03',
                  reservationTime: '13:30',
                  name: '이우주',
                  gender: '남성',
                  age: '3',
                  visitingReason: '차사고',
                );
              } else {
                // If the document exists, return a HospitalRecordComponent with the fetched data
                return HospitalRecordComponent(
                  // Data from Firestore
                  hospitalName: snapshot.data!['hospital_name'],
                  reservationDay: snapshot.data!['reservation_day'],
                  reservationTime: snapshot.data!['reservation_time'],
                  name: snapshot.data!['name'],
                  gender: snapshot.data!['gender'],
                  age: snapshot.data!['age'],
                  visitingReason: snapshot.data!['visitingReason'],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
