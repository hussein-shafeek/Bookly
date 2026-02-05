import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(text, style: Styles.textStyle16Gt),
      backgroundColor: AppColors.brown,
    ),
  );
}
