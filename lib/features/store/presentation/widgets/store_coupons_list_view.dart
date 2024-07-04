import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/widgets/coupon_item.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';

import '../../../../core/shimmer/coupons_shimmer.dart';

// class StoreCouponsListView extends StatelessWidget {
//   const StoreCouponsListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<StoreCouponsCubit, StoreCouponsState>(
//       buildWhen: (previous, current) =>
//           current is FilterCouponsSuccess ||
//           current is StoreCouponsLoaded ||
//           current is ChangeDropDownValue ||
//           current is CategorySelectionChanged,
//       builder: (context, state) {
//         if (state is FilterCouponsLoading || state is StoreCouponsLoading) {
//           return const CouponsShimmer();
//         } else if (state is FilterCouponsSuccess ||
//             state is StoreCouponsLoaded) {
//           if (state is FilterCouponsSuccess && state.filteredCoupons.isEmpty ||
//               state is StoreCouponsLoaded && (state).storeCoupons.isEmpty) {
//             return const Center(
//               child: Text('No Coupons Available'),
//             );
//           } else {
//             final coupons = state is FilterCouponsSuccess
//                 ? state.filteredCoupons
//                 : (state as StoreCouponsLoaded).storeCoupons;
//             return ListView.separated(
//               padding: EdgeInsets.zero,
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     CouponItem(
//                       model: coupons[index],
//                       index: index,
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return SizedBox(
//                   height: 10.h,
//                 );
//               },
//               itemCount: coupons.length,
//             );
//           }
//         } else if (state is StoreCouponsError) {
//           return Center(
//             child: Text(state.message),
//           );
//         } else {
//           return const SizedBox(); // Handle other states without displaying a message
//         }
//       },
//     );
//   }
// }

class StoreCouponsListView extends StatelessWidget {
  const StoreCouponsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCouponsCubit, StoreCouponsState>(
      buildWhen: (previous, current) =>
      current is FilterCouponsSuccess ||
          current is StoreCouponsLoaded ||
          current is ChangeDropDownValue ||
          current is CategorySelectionChanged,
      builder: (context, state) {
        List<dynamic> coupons = [];
        if (state is FilterCouponsSuccess) {
          coupons = state.filteredCoupons;
        } else if (state is StoreCouponsLoaded) {
          coupons = state.storeCoupons;
        }

        return ListView.separated(
          key: ValueKey<int>(coupons.length), // Dynamic key based on coupons length
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                CouponItem(
                  model: coupons[index],
                  index: index,
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.h),
          itemCount: coupons.length,
        );
      },
    );
  }
}
