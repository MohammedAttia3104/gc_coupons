import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/features/home/presentation/controllers/bottom_nav_bar_cubit.dart';
import 'package:gc_coupons/features/home/presentation/home_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/app_drawer_view.dart';
import 'package:gc_coupons/features/home/presentation/widgets/home_layout.dart';
import 'package:gc_coupons/features/stores/presentation/all_stores_screen.dart';
import '../../favourites/presentation/favourites_screen.dart';
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
    return BlocProvider<BottomNavBarCubit>(
      create: (_) => BottomNavBarCubit(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        drawer: const AppDrawerView(),
        body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return PageView(
              allowImplicitScrolling: true,
              controller:
              BlocProvider
                  .of<BottomNavBarCubit>(context)
                  .controller,
              children: const [
                HomeView(),
                AllStoresScreen(),
                FavouritesScreen(),
              ],
            );
          },
        ),
        bottomNavigationBar: const HomeLayOut(),
      ),
    );
  }
}
