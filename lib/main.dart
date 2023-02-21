import 'package:flutter/material.dart';
import 'package:tflite_image_classification/TfliteModel.dart';
import 'package:tflite_image_classification/get_started_page.dart';
import 'package:tflite_image_classification/sign_in_screen.dart';
import 'package:tflite_image_classification/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-in': (context) =>  SignInScreen(),
          '/home': (context) => TfliteModel(),
        },
    );
  }
}
