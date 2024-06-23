import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/size_config.dart';

import 'widgets/build_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: AppFonts.fontSize16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Categories',
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: AppFonts.fontSize16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'My Coupons',
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: AppFonts.fontSize16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: AppFonts.fontSize16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const HomeView(),
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
