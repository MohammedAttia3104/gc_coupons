import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/functions/copy_code_to_clipboard.dart';


class CopyCouponCodeWidget extends StatelessWidget {
  final String code;

  const CopyCouponCodeWidget({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await copyCodeToClipboard(code: code);

        ///Todo : Refactor Later
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(
        //       'Code Copied to Clipboard',
        //       style: AppStyles.style12Nor,
        //     ),
        //   ),
        // );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              alignment: Alignment.bottomCenter,

              title: Center(
                child: Text(
                  'Code Copied to Clipboard',
                  style: AppStyles.style12Nor,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
              backgroundColor: AppColors.kWhiteColor,
            );
          },
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ).w,
            child: Icon(
              FontAwesomeIcons.copy,
              size: 24.r,
              color: AppColors.kWhiteColor,
            ),
          ),
          Text(
            'Copy',
            style: TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
