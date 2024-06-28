import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';

class CustomRoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final double buttonHeight;
  final double buttonWidth;
  final Color? buttonColor;

  const CustomRoundedButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.textStyle,
    required this.buttonHeight,
    required this.buttonWidth,
    this.buttonColor ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.showCouponBtnColor,
        minimumSize: Size(buttonWidth, buttonHeight),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
