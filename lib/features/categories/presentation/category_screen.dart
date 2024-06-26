import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/features/categories/presentation/widgets/category_single_item.dart';
import 'package:gc_coupons/features/home/presentation/widgets/app_drawer_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.offWhiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_outlined,
            size: 30,
            color: AppColors.kBlackColor,
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        elevation: 5,
        title: const Text(
          AppStrings.allCategories,
        ),
        shadowColor: AppColors.kBlackColor,
      ),
      drawer: const AppDrawerView(),
      body: GridView.builder(
        padding: EdgeInsets.all(14.h),
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          //childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return const CategorySingleItem();
        },
        itemCount: 40,
      ),
    );
  }
}
