import 'package:flutter/material.dart';
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
