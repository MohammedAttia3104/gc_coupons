import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.storeDataModel,
  });

  final StoreDataModel storeDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.offWhiteColor,
        borderRadius: BorderRadius.circular(25).r,
        boxShadow: const [
          BoxShadow(
            color: AppColors.kGreyColor,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).w,
        child: Row(
          children: [
            FancyShimmerImage(imageUrl: storeDataModel.storeImage),
            SizedBox(
              width: 10.w,
            ),
            Text(
              storeDataModel.storeName,
              style: TextStyle(
                color: AppColors.kBlackColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
