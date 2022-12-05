import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tflite_image_classification/get_started_page.dart';
import '../../shared/theme.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => GetStartedPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
          
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img-logo-app.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
