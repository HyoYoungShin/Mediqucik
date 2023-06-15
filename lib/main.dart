import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquick/providers/review_documentId_provider.dart';
import 'package:mediquick/providers/reservation_documentId_provider.dart';
import 'package:mediquick/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase
      .initializeApp(); // Initializing Firebase with your project's configuration.

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReviewDocumentIdProvider()),
        ChangeNotifierProvider(
            create: (context) => ReservationDocumentIdProvider()),

        // Add other providers if needed
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}
