import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.storeDataModel,
  });

  final StoreDataModel storeDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.storeData,
          arguments: storeDataModel.storeId.toString(),
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 100.0.h,
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.kGreyColor,
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomFancyShimmerImage(imageUrl: storeDataModel.storeImage ?? ''),
            SizedBox(
              width: 10.w,
            ),
            FittedBox(
              child: Text(
                storeDataModel.storeName ?? '',
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
