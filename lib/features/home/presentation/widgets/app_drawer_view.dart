import 'package:flutter/material.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/functions/navigate_to_launched_url.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/utils/constants.dart';

class AppDrawerView extends StatelessWidget {
  const AppDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        clipBehavior: Clip.none,
        width: MediaQuery.sizeOf(context).width * 0.7,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.home,
                size: AppConstantSizes.kDrawerIconSize,
              ),
              title: Text(
                AppStrings.homeTab,
                style: AppStyles.drawerTabStyle,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: AppColors.shadowColor,
              thickness: 0.5,
            ),
            ListTile(
              leading: const Icon(
                Icons.search,
                size: AppConstantSizes.kDrawerIconSize,
              ),
              title: Text(
                AppStrings.browseCategoriesTab,
                style: AppStyles.drawerTabStyle,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.allCategories,
                );
              },
            ),
            Divider(
              color: AppColors.shadowColor,
              thickness: 0.5,
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_page_rounded,
                size: AppConstantSizes.kDrawerIconSize,
              ),
              title: Text(
                AppStrings.advertiseWithUsTab,
                style: AppStyles.drawerTabStyle,
              ),
              onTap: () async {
                await navigateToLaunchedUrl(link: kAdvertiseWithUsUrl);
              },
            ),
            Divider(
              color: AppColors.shadowColor,
              thickness: 0.5,
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                size: AppConstantSizes.kDrawerIconSize,
              ),
              title: Text(
                AppStrings.contactUsTab,
                style: AppStyles.drawerTabStyle,
              ),
              onTap: () async {
                await navigateToLaunchedUrl(link: kContactUsUrl);
              },
            ),
            Divider(
              color: AppColors.shadowColor,
              thickness: 0.5,
            ),
            ListTile(
              leading: const Icon(
                Icons.lock,
                size: AppConstantSizes.kDrawerIconSize,
              ),
              title: Text(
                AppStrings.privacyPolicyTab,
                style: AppStyles.drawerTabStyle,
              ),
              onTap: () async {
                await navigateToLaunchedUrl(link: kPrivacyPolicyUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
