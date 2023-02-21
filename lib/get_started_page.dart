import 'package:flutter/material.dart';
import 'package:tflite_image_classification/shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/img-splash-screen.png'),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 380,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black,
                    ],
                  )),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'Vegetable Classification App',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Recognize vegetable names with the\nMobilenetv2 (CNN) Method and TFLite\nconnected with the Flutter app',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-in');

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 52,
                        vertical: 14,
                      ),
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 46,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kBlueColor,
                      ),
                      child: Text('Get Started',
                          style: whiteTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
