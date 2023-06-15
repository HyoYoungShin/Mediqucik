import 'package:flutter/material.dart';
class BigLogo extends StatelessWidget {
  const BigLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 90.0),
      child: Image.asset(
        'asset/img/logo.png',
        width: 120.0,
        height: 120.0,
      ),
    );
  }
}