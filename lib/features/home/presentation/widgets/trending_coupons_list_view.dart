import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/features/home/presentation/widgets/trending_coupon_item.dart';

class TrendingCouponsListView extends StatelessWidget {
  const TrendingCouponsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingCouponsCubit>(
      create: (context) => SubjectBloc(),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
        const TrendingCouponItem(),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(
              height: AppPadding.padding8h,
            ),
        itemCount: 10,
      ),
    );
  }
}
