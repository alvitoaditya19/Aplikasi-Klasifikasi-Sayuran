
import 'package:flutter/material.dart';
import 'package:tflite_image_classification/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({

    required this.label,
    this.isShowTitle = true,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.isHaveColor = false,
    this.backgroundColor = Colors.transparent,
    this.isHaveBorderSide = true,
    this.controller,
  });

  final String label;
  final TextInputType keyboardType;
  final bool isObscure;
  final bool isShowTitle;
  final bool isHaveColor;
  final Color backgroundColor;
  final bool isHaveBorderSide;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            label,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 14,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObscure,
          decoration: InputDecoration(
            filled: isHaveColor,
            fillColor: isHaveColor ? backgroundColor : null,
            hintText: !isShowTitle ? label : null,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  isHaveBorderSide ? const BorderSide() : BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
