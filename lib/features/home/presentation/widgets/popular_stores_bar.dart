import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';

class PopularStoresBar extends StatelessWidget {
  final Widget? hideSearchButton;
  final CouponModel? couponModel;

  const PopularStoresBar({super.key, this.hideSearchButton, this.couponModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.popularStores,
          style: AppStyles.style20Bold,
        ),
        const Spacer(),
        hideSearchButton ??
            SectionRoundedButton(
              title: AppStrings.searchStores,
              icon: const Icon(
                Icons.search,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.searchScreen,
                );
              },
            ),
      ],
    );
  }
}
