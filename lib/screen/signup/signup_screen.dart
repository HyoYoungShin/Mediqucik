import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/component/big_logo.dart';
import 'package:mediquick/component/bottom_button.dart';
import 'package:mediquick/component/text_and_textfield.dart';
import 'package:mediquick/screen/main_screen/main_screen.dart';
import 'package:mediquick/screen/signup/signup_screen_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupScreenController signupScreenController =
        Get.put(SignupScreenController());

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
                //input email, id, password from user
                _Input(
                  emailTextController:
                      signupScreenController.emailTextController,
                  idTextController: signupScreenController.idTextController,
                  passwordTextController:
                      signupScreenController.passwordTextController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                //button for signup
                BottomButton(
                  buttonName: 'SIGNUP',
                  onPressed: () async {
                    final newUser =
                        await authentication.createUserWithEmailAndPassword(
                            email:
                                signupScreenController.emailTextController.text,
                            password: signupScreenController
                                .passwordTextController
                                .text); // Registering the user using Firebase Authentication

                    Get.offAll(() => MainScreen());
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
  final TextEditingController emailTextController;
  final TextEditingController idTextController;
  final TextEditingController passwordTextController;

  const _Input(
      {required this.emailTextController,
      required this.idTextController,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            //input email
            TextAndTextField(
              textString: 'Email',
              isObsecureTextTrue: false,
              textEditingController: emailTextController,
            ),
            SizedBox(
              height: 30.0,
            ),
            //input id
            TextAndTextField(
              textString: 'Id',
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
