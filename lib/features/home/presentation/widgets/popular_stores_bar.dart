import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';

class PopularStoresBar extends StatelessWidget {
  final Widget? hideSearchButton;

  const PopularStoresBar({super.key, this.hideSearchButton});

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
              onTap: () {},
            ),
      ],
    );
  }
}
