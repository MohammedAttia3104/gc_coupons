import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/shimmer/chips_shimmer.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';

import '../controllers/store_coupons_cubit/store_coupons_cubit.dart';

class FilterChipListView extends StatefulWidget {
  const FilterChipListView({
    super.key,
  });

  @override
  State<FilterChipListView> createState() => _FilterChipListViewState();
}

class _FilterChipListViewState extends State<FilterChipListView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const ChipsShimmer();
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: 40.h,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return FilterChip(
                  label: Text(
                    state.categories[index].name,
                    style: AppStyles.style14Bold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  onSelected: (bool value) {
                    var cubit = context.read<StoreCouponsCubit>();
                    if (value) {
                      cubit.selectCategory(state.categories[index]);
                      setState(() {
                        isSelected = true;
                      });
                    } else {
                      cubit.deselectCategory(state.categories[index]);
                      setState(() {
                        isSelected = false;
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0.r),
                    side: isSelected
                      ? BorderSide(
                          color: AppColors.kBlackColor,
                          width: 0.6,
                        )
                      : BorderSide(
                          color: AppColors.kGreyColor,
                          width: 0.4,
                        ),
                  ),
                  shadowColor: AppColors.shadowColor,
                  backgroundColor: AppColors.kWhiteColor,
                  selectedShadowColor: AppColors.kBlackColor,
                  color: WidgetStateProperty.all(AppColors.kWhiteColor),

                  //selected: true,
                  //showCheckmark: true,
                  //selectedColor: Colors.red,
                  avatar: Icon(
                    Icons.close,
                    color: AppColors.kBlackColor,
                    size: 18.0.r,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 5.w,
                );
              },
              itemCount: 20,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
