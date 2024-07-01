import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';

class IsEmptySearchWidget extends StatelessWidget {
  const IsEmptySearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Center(
        child: Text(
          AppStrings.searchForYourFavouriteStores,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
