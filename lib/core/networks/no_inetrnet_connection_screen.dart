import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/widgets/custom_rounded_button.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Lottie.asset(
              "assets/lottie/no_connection.json",
              height: 250.h,
              width: 250.w,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: AppPadding.padding30h,
            ),
            Text(
              AppStrings.noInternetConnection,
              style: AppStyles.noConnectionStyle,
            ),
            SizedBox(
              height: AppPadding.padding20h,
            ),
            Text(
              AppStrings.noConnectionDescription,
              style: AppStyles.style12Nor,
            ),
            SizedBox(
              height: 120.h,
            ),
            CustomRoundedButton(
              buttonText: AppStrings.retry,
              buttonHeight: 35.0.h,
              buttonWidth: 200.0.w,
              textStyle: AppStyles.style14Bold,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
