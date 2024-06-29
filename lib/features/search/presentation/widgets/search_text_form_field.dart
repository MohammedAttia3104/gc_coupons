import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/features/search/presentation/controllers/search_cubit.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

class SearchTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController searchController;

  const SearchTextFormField({
    super.key,
    required this.onChanged,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100.h,
          color: AppColors.appBarColor,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 50.h,
            bottom: 10.h,
          ),
          child: Material(
            color: AppColors.offWhiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: AppColors.offWhiteColor,
                hintText: 'Search',
                prefixIcon:
                    const Icon(Icons.search, color: AppColors.kGreyColor),
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.clear, color: AppColors.kGreyColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                  borderSide: const BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                  borderSide: const BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                  borderSide: const BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
              ),
              controller: searchController,
              onChanged: onChanged,
              cursorColor: AppColors.showCouponBtnColor,
              cursorHeight: 15.h,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              autofocus: true,
            ),
          ),
        ),
      ],
    );
  }
}
