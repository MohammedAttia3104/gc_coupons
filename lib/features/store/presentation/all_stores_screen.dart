import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/widgets/search_container.dart';
import 'package:gc_coupons/core/shimmer/all_stores_item_shimmer.dart';

class AllStoresScreen extends StatelessWidget {
  const AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0).w,
        child: Column(
          children: [
            const SearchContainer(),
            SizedBox(height: 14.h),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.h,
              children: List.generate(
                8,
                (index) {
                  return const AllStoresItemShimmer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
