import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';

class PopularStoresBar extends StatelessWidget {
  const PopularStoresBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.popularStores,
          style: AppStyles.style20Bold,
        ),
        const Spacer(),
        SectionRoundedButton(
          title: AppStrings.searchStores,
          icon: const Icon(Icons.search,),
          onTap: () {},
        ),
      ],
    );
  }
}
