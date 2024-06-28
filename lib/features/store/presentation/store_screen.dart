import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/features/store/presentation/widgets/store_view.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: StoreView(),
    );
  }
}
