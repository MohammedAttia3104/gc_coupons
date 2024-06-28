import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/widgets/coupon_item.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';

class StoreCouponsListView extends StatelessWidget {
  const StoreCouponsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCouponsCubit, StoreCouponsState>(
      builder: (context, state) {
        if (state is StoreCouponsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is StoreCouponsLoaded) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return CouponItem(
                model: state.storeCoupons[index],
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemCount: state.storeCoupons.length,
          );
        } else if (state is StoreCouponsError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
