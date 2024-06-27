import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';

class AllCategoriesButton extends StatelessWidget {
  const AllCategoriesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionRoundedButton(
      title: AppStrings.allCategories,
      onTap: () => Navigator.pushNamed(context, Routes.allCategories),
    );
  }
}
