import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const BottomButton({
    required this.buttonName,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonName),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      ),
    );
  }
}
