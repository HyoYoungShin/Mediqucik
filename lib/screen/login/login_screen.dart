import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/component/big_logo.dart';
import 'package:mediquick/component/bottom_button.dart';
import 'package:mediquick/component/text_and_textfield.dart';
import 'package:mediquick/screen/login/login_screen_controller.dart';
import 'package:mediquick/screen/main_screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart'; //파이어베이스

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController =
        Get.put(LoginScreenController());

    final authentication =
        FirebaseAuth.instance; // Initializing the FirebaseAuth instance

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //input email & password from user
                _Input(
                    idTextController: loginScreenController.idTextController,
                    passwordTextController:
                        loginScreenController.passwordTextController),
                SizedBox(
                  height: 20.0,
                ),
                //button for login
                BottomButton(
                  buttonName: 'LOGIN',
                  onPressed: () async {
                    try {
                      final newUser =
                          await authentication.signInWithEmailAndPassword(
                              email:
                                  loginScreenController.idTextController.text,
                              password: loginScreenController
                                  .passwordTextController
                                  .text); // Logging in the user using Firebase Authentication

                      //login success
                      Get.offAll(() => MainScreen());
                      //
                      print('upload project to github!');
                    } catch (e) {
                      //login failed
                      print(e);
                      Get.snackbar('로그인 오류', '아이디 혹은 비밀번호가 올바르지 않습니다.');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final TextEditingController idTextController;
  final TextEditingController passwordTextController;

  const _Input(
      {required this.idTextController,
      required this.passwordTextController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BigLogo(),
            Text(
              'Log In',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            //input email
            TextAndTextField(
              textString: 'Email',
              isObsecureTextTrue: false,
              textEditingController: idTextController,
            ),
            SizedBox(
              height: 30.0,
            ),
            //input password
            TextAndTextField(
              textString: 'Password',
              isObsecureTextTrue: true,
              textEditingController: passwordTextController,
            ),
          ],
        ),
      ),
    );
  }
}
