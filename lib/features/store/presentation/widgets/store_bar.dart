import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';
import 'package:gc_coupons/generated/assets.dart';
import 'package:auto_size_text/auto_size_text.dart';

class StoreBar extends StatelessWidget {
  final StoreDataModel storeModel;

  const StoreBar({
    super.key,
    required this.storeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.only(top: 35.h),
        width: MediaQuery.sizeOf(context).width,
        //height: 35.h,
        decoration: const BoxDecoration(
          color: AppColors.kWhiteColor,
        ),
        child: Row(
          children: [
            //leading
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_sharp),
            ),
            SizedBox(
              width: 10.w,
            ),
            //title
            AutoSizeText(
              storeModel.storeName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              minFontSize: 10,
              stepGranularity: 10,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            //trailing
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: AppColors.kBlackColor,
                size: 24.r,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.assetsIconsShareNodesSolid,
                fit: BoxFit.contain,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
