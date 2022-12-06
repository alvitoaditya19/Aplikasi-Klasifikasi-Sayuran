import 'package:flutter/material.dart';
import 'package:tflite_image_classification/shared/theme.dart';

class ImageVege extends StatelessWidget {
  final String name;
  const ImageVege(this.name,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          border: Border.all(
            color: kBlueColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(18)),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  name,
                ))),
      ),
    );
  }
}
