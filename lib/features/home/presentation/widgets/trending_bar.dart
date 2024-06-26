import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';

class TrendingBar extends StatelessWidget {
  const TrendingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.trendingCoupons,
          style: AppStyles.style20Bold,
        ),
        const Spacer(),
        SectionRoundedButton(
          title: AppStrings.allCategories,
          onTap: () => Navigator.pushNamed(context, Routes.allCategories),
        ),
      ],
    );
  }
}
