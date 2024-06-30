import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/shimmer/coupons_shimmer.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/core/widgets/coupon_item.dart';
import 'package:shimmer/shimmer.dart';

class TrendingCouponsListView extends StatelessWidget {
  const TrendingCouponsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCouponsCubit, TrendingCouponsState>(
      builder: (context, state) {
        if (state is TrendingCouponsLoading) {
          return const CouponsShimmer();
        } else if (state is TrendingCouponsLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CouponItem(
                model: state.trendingCoupons[index],
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: AppPadding.padding8h);
            },
            itemCount: state.trendingCoupons.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
