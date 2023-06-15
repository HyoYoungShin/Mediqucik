import 'package:flutter/material.dart';

class ReviewDocumentIdProvider with ChangeNotifier {
  String _documentId = 'defaultvalueofId';

  String get documentId => _documentId;

  set documentId(String value) {
    _documentId = value;
    notifyListeners();
  }
}
