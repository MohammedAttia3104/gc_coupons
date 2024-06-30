import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/functions/navigate_to_launched_url.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/home/presentation/widgets/copy_coupon_code_widget.dart';
import 'package:gc_coupons/features/home/presentation/widgets/coupon_code_style_widget.dart';
import 'package:gc_coupons/generated/assets.dart';
import 'package:lottie/lottie.dart';

import 'html_content.dart';

class ShowCouponButton extends StatelessWidget {
  final int couponId;
  final int index;
  final CouponModel couponModel;

  const ShowCouponButton({
    super.key,
    required this.couponId,
    required this.index,
    required this.couponModel,
  });

  @override
  Widget build(BuildContext context) {
    return SectionRoundedButton(
      title: showCouponTitle(couponModel),
      backgroundColor: showCouponBackgroundColor(couponModel),
      borderRadius: 10.0.r,
      buttonWidth: MediaQuery.sizeOf(context).width,
      titleColor: AppColors.kWhiteColor,
      buttonHight: 40.h,
      titleSize: 24.sp,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            debugPrint(
                'dialog width :  ${MediaQuery.sizeOf(context).width.toString()}');
            debugPrint(
                'dialog height :  ${(0.7 * MediaQuery.sizeOf(context).height).toString()}');
            return Dialog(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: AppColors.kBlackColor,
                            size: 24.r,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomFancyShimmerImage(
                          imageUrl: couponModel.imageUrl,
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            couponModel.title,
                            style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppStrings.description,
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: AppColors.kGreyColor,
                      thickness: 1,
                    ),
                    FittedBox(
                      child: HtmlContent(
                        htmlData: couponModel.couponDesc,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    ifDealThenShowCheck(couponModel, context),
                    SizedBox(
                      height: 8.h,
                    ),
                    isDealVisitStore(couponModel, context),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Color showCouponBackgroundColor(CouponModel couponModel) {
  switch (couponModel.ctype) {
    case '1':
      return AppColors.showCouponBtnColor;
    case '3':
      return AppColors.greenBtnColor;
    default:
      return AppColors.showCouponBtnColor;
  }
}

String showCouponTitle(CouponModel couponModel) {
  switch (couponModel.ctype) {
    case '1':
      return AppStrings.showCoupon;
    case '3':
      return AppStrings.getDeal;
    default:
      return AppStrings.showCoupon;
  }
}

Widget ifDealThenShowCheck(CouponModel couponModel, BuildContext context) {
  if (couponModel.ctype == '3') {
    return Center(
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.checkCircle,
            color: Colors.cyan[600],
            size: 40.r,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Deal Activated',
            style: TextStyle(
              color: AppColors.kBlackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  } else if (couponModel.ctype == '1') {
    return SectionRoundedButton(
      title: '',
      onTap: () {},
      backgroundColor: Colors.cyanAccent[400],
      buttonHight: 50.0.h,
      buttonWidth: MediaQuery.sizeOf(context).width,
      borderRadius: 10.0.r,
      customWidget: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            CouponCodeStyleWidget(
              code: couponModel.couponCode,
            ),
            CopyCouponCodeWidget(
              code: couponModel.couponCode,
            ),
          ],
        ),
      ),
    );
  } else {
    return const SizedBox();
  }
}

Widget isDealVisitStore(CouponModel couponModel, BuildContext context) {
  switch (couponModel.ctype) {
    case '1':
      return SectionRoundedButton(
        title: 'Visit ${couponModel.storeName}',
        backgroundColor: AppColors.appNameColor,
        borderRadius: 10.0.r,
        buttonHight: 40.h,
        buttonWidth: MediaQuery.sizeOf(context).width,
        titleColor: AppColors.kBlackColor,
        titleSize: 20.0.sp,
        onTap: () async => await navigateToLaunchedUrl(
          link: couponModel.storeUrl,
        ),
      );
    case '3':
      return Container(
        width: MediaQuery.sizeOf(context).width,
        height: 30.h,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Redirecting to ${couponModel.storeName}',
                  style: const TextStyle(
                    color: AppColors.kBlackColor,
                  ),
                  maxLines: 1,
                ),
              ),
              Lottie.asset(
                Assets.lottieBlackLoaddingIndicator,
                width: 30.w,
                fit: BoxFit.cover,
              ),
              FutureBuilder(
                future: Future.delayed(
                  const Duration(milliseconds: 500),
                  () async {
                    return await navigateToLaunchedUrl(
                      link: couponModel.storeUrl,
                    );
                  },
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const SizedBox();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      );
    default:
      return const SizedBox();
  }
}
