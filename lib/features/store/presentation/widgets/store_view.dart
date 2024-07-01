import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/shimmer/store_shimmer.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';
import 'package:gc_coupons/features/home/presentation/widgets/popular_grid_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/popular_stores_bar.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';
import 'package:gc_coupons/features/store/presentation/widgets/filter_chip_list_view.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_bar.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_coupons_list_view.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_custom_drop_down.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_shop_now_container.dart';

import '../../../../core/services/service_locator.dart';

class StoreView extends StatelessWidget {
  const StoreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state is StoreLoading) {
          return const StoreShimmer();
        } else if (state is StoreLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                StoreBar(
                  storeModel: state.storeDataModel,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomFancyShimmerImage(
                      imageUrl: state.storeDataModel.storeImage ?? '',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    StoreShopNowContainer(
                        storeDataModel: state.storeDataModel),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppStrings.couponsAndDealsNumber(
                                  state.storeDataModel.count ?? '0',
                                ),
                                style: AppStyles.style18Bold,
                              ),
                              const Spacer(),
                              const StoreCustomDropDown(),
                            ],
                          ),
                          const FilterChipListView(),
                          SizedBox(
                            height: 8.0.h,
                          ),
                          const StoreCouponsListView(),
                          SizedBox(
                            height: 15.h,
                          ),
                          const PopularStoresBar(
                            hideSearchButton: SizedBox.shrink(),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const PopularGridView(),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
