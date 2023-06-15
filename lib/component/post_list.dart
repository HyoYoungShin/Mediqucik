import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediquick/component/post_component.dart';
import 'package:provider/provider.dart';
import 'package:mediquick/providers/review_documentId_provider.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetching the documentId from the ReviewDocumentIdProvider
    final documentId =
        Provider.of<ReviewDocumentIdProvider>(context).documentId;

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              // A FutureBuilder is used to interact with Firestore
              FutureBuilder<DocumentSnapshot?>(
                // Checking if the documentId is not equal to 'defaultvalueofId'
                future: documentId != 'defaultvalueofId'
                    // If not, fetch the document from Firestore collection 'Review' with the documentId
                    ? FirebaseFirestore.instance
                        .collection('Review')
                        .doc(documentId)
                        .get()
                        .then((snapshot) => snapshot)
                    // If documentId is equal to 'defaultvalueofId', return null
                    : null,
                // The builder then checks the state of the future
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot?> snapshot) {
                  // Check if the documentId is 'defaultvalueofId', or if the connection is not yet done, or if the data is null or if the document does not exist
                  // If any of these conditions are true, return a default PostComponent
                  if (documentId == 'defaultvalueofId' ||
                      snapshot.connectionState != ConnectionState.done ||
                      snapshot.data == null ||
                      !snapshot.data!.exists) {
                    return PostComponent(
                      // Default data
                      id: 'idonwannabefool',
                      profileImg: 'asset/img/logo.png',
                      imageAddress: 'asset/img/hospital_review_jung.png',
                      title: '성남 정병원 후기',
                      content: '뜻하지 않은 교통사고로 실려온 성남구 수정에 위치한 정병원입니다',
                      numberOfComment: 10,
                      numberOflikes: 3,
                    );
                  } else {
                    // If the document exists, return a PostComponent with the fetched data
                    return PostComponent(
                      // Data from Firestore
                      id: 'medi',
                      profileImg: 'asset/img/logo.png',
                      imageAddress: 'asset/img/review.png',
                      title: snapshot.data!['Title'],
                      content: snapshot.data!['Content'],
                      numberOfComment: 10,
                      numberOflikes: 3,
                    );
                  }
                },
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
