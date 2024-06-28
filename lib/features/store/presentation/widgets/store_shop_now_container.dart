import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_bar.dart';

class StoreShopNowContainer extends StatelessWidget {
  final StoreDataModel storeDataModel;

  const StoreShopNowContainer({
    super.key,
    required this.storeDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGreyColor.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            storeDataModel.storeName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '${storeDataModel.count} ${storeDataModel.storeName} Coupon Codes & Offers available',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kBlackColor,
            ),
            textAlign: TextAlign.center,
            // maxLines: 3,
          ),
          SizedBox(
            height: 5.h,
          ),
          SectionRoundedButton(
            title: AppStrings.shopNow,
            backgroundColor: Colors.red,
            titleColor: AppColors.kWhiteColor,
            borderRadius: 10.r,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
