import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/const/colors.dart';
import 'package:mediquick/screen/add_review/add_review_controller.dart';
import 'package:mediquick/screen/main_screen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediquick/providers/review_documentId_provider.dart';
import 'package:provider/provider.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //use AddReviewController
    final AddReviewController addReviewController =
        Get.put(AddReviewController());

    FirebaseFirestore fireStore =
        FirebaseFirestore.instance; //Firebase instance

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_BLUE_GREEN_COLOR,
        title: const Text(
          '리뷰 추가하기',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: MAIN_IVORY_COLOR,
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            //input title
            _TextAndTextField(
              textString: 'Title',
              isObsecureTextTrue: false,
              textEditingController: addReviewController.titleTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            //input content
            _TextAndTextField(
              textString: 'Content',
              isObsecureTextTrue: false,
              textEditingController: addReviewController.contentTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            //click button to add review
            ElevatedButton(
              onPressed: () async {
                // Create a new document reference and save it
                var newDocRef = fireStore.collection('Review').doc();

                // Add data to the document with the new reference
                newDocRef.set({
                  'Title': addReviewController.titleTextController.text,
                  'Content': addReviewController.contentTextController.text,
                }).then((value) {
                  // Save the document id
                  context.read<ReviewDocumentIdProvider>().documentId =
                      newDocRef.id;

                  Get.offAll(() => MainScreen());
                }); //add Review record to Firebase
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('리뷰 추가'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextAndTextField extends StatelessWidget {
  final String textString;
  final bool isObsecureTextTrue;
  final TextEditingController textEditingController;

  const _TextAndTextField({
    required this.textString,
    required this.isObsecureTextTrue,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: 65.0,
            child: Text(
              textString,
              style: textStyle,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: SizedBox(
              height: 33.0,
              child: TextField(
                obscureText: isObsecureTextTrue,
                decoration: textFieldDecoration,
                controller: textEditingController,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
    );
  }
}
