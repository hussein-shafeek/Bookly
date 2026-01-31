import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;
  final double? fontSize;
  final bool isLoading;

  const CustomButton({
    Key? key,
    this.borderRadius,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.fontSize,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15.0),
          ),
        ),
        child: isLoading
            ? const FittedBox(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: LoadingIndicator(),
                ),
              )
            : Text(
                text,
                style: Styles.textStyle18.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}
