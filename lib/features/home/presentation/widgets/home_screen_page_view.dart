import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/networks/network_connection_cubit/internet_connection_cubit.dart';
import 'package:gc_coupons/core/networks/no_inetrnet_connection_screen.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/popular_stores_cubit/popular_stores_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/features/home/presentation/widgets/home_view_builder.dart';
import 'package:gc_coupons/features/home/presentation/widgets/app_drawer_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/home_layout.dart';

import 'build_app_bar.dart';

class HomeScreenPageView extends StatefulWidget {
  const HomeScreenPageView({
    super.key,
  });

  @override
  State<HomeScreenPageView> createState() => _HomeScreenPageViewState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenPageViewState extends State<HomeScreenPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: const AppDrawerView(),
      body: const HomeViewBuilder(),
      bottomNavigationBar: const HomeLayOut(),
    );
  }
}
