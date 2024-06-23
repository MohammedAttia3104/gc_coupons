import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: HomeView(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      leading: IconButton(
        icon:  const Icon(
          Icons.menu_outlined,
          size: 30,
          color: AppColors.kBlackColor,
        ),
        onPressed: () {},
      ),
      elevation: 5,
      title: Text(
        AppStrings.appName,
        style: TextStyle(
          color: AppColors.appNameColor,
          fontSize: AppFonts.fontSize24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to the Home Screen!'),
    );
  }
}
