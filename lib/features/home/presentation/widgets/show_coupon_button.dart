import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/functions/navigate_to_launched_url.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/features/home/presentation/widgets/copy_coupon_code_widget.dart';
import 'package:gc_coupons/features/home/presentation/widgets/coupon_code_style_widget.dart';

import '../../../../core/widgets/html_content.dart';

class ShowCouponButton extends StatelessWidget {
  const ShowCouponButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCouponsCubit, TrendingCouponsState>(
      builder: (context, state) {
        if (state is TrendingCouponsLoaded) {
          return SectionRoundedButton(
            title: AppStrings.showCoupon,
            backgroundColor: AppColors.showDealBtnColor,
            borderRadius: 10.0.r,
            buttonWidth: MediaQuery.sizeOf(context).width,
            titleColor: AppColors.kWhiteColor,
            buttonHight: 40.h,
            titleSize: 24.sp,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.65,
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
                                imageUrl: state.trendingCoupons[0].imageUrl,
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Text(
                                  state.trendingCoupons[0].title,
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
                          HtmlContent(
                            htmlData: state.trendingCoupons[0].couponDesc,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SectionRoundedButton(
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
                                    code: state.trendingCoupons[0].couponCode,
                                  ),
                                  CopyCouponCodeWidget(
                                    code: state.trendingCoupons[0].couponCode,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SectionRoundedButton(
                            title:
                                'Visit ${state.trendingCoupons[0].storeName}',
                            backgroundColor: AppColors.appNameColor,
                            borderRadius: 10.0.r,
                            buttonHight: 30.h,
                            buttonWidth: MediaQuery.sizeOf(context).width,
                            titleColor: AppColors.kBlackColor,
                            titleSize: 20.0.sp,
                            onTap: () async => await navigateToLaunchedUrl(
                              link: state.trendingCoupons[0].storeUrl,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
