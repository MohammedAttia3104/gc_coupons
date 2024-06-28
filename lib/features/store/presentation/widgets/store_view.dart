import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/widgets/coupon_item.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_bar.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_coupons_list_view.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_custom_drop_down.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_shop_now_container.dart';

class StoreView extends StatelessWidget {
  const StoreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state is StoreLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
                      imageUrl: state.storeDataModel.storeImage,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    StoreShopNowContainer(storeDataModel: state.storeDataModel),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
                      child: Row(
                        children: [
                          Text(
                            AppStrings.couponsAndDealsNumber(
                              state.storeDataModel.count,
                            ),
                            style: AppStyles.style18Bold,
                          ),
                          const Spacer(),
                          const StoreCustomDropDown(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const StoreCouponsListView(),
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
