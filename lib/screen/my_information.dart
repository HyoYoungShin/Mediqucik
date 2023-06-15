import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle categotyStyle = TextStyle(
      fontSize: 16.5,
    );
    final double categoryWidth = 80;

    // Firebase auth instance
    final FirebaseAuth auth = FirebaseAuth.instance;
    // Current user
    final User? user = auth.currentUser;
    // Email of the current user
    final String email = user?.email ?? 'No user signed in';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          '나의 정보',
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
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Row(
                    children: [
                      Text(
                        '회원가입 정보',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                //display email
                Row(
                  children: [
                    Container(
                      width: categoryWidth,
                      child: Text(
                        'Email',
                        style: categotyStyle,
                      ),
                    ),
                    Text(email),
                  ],
                ),
                //display id
                Row(
                  children: [
                    Container(
                      width: categoryWidth,
                      child: Text(
                        'Id',
                        style: categotyStyle,
                      ),
                    ),
                    Text('medi'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}