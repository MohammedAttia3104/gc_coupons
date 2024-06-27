import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/functions/copy_code_to_clipboard.dart';
import 'package:gc_coupons/core/functions/navigate_to_launched_url.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/html_content.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Code Copied to Clipboard',
              style: AppStyles.style12Nor,
            ),
          ),
        );
        // AlertDialog(
        //   actions: <Widget>[
        //     TextButton(
        //       child: Text('OK'),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
        //   title: Text(
        //     'Code Copied to Clipboard',
        //     style: AppStyles.style12Nor,
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius:
        //         BorderRadius.circular(10.r),
        //   ),
        //   backgroundColor: AppColors.kWhiteColor,
        //   actionsAlignment:
        //       MainAxisAlignment.center,
        // );
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