import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/widgets/search_container.dart';

import '../../../core/constants/size_config.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
        child: Column(
          children: [
            SizedBox(height: AppPadding.padding14h),
            const SearchContainer(),
          ],
        ),
      ),
    );
  }
}
