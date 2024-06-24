import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'grid_item.dart';

class PopularGridView extends StatelessWidget {
  const PopularGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        padding: EdgeInsets.only(left: 5.w),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          20,
          (index) => const GridItem(),
        ),
      ),
    );
  }
}
