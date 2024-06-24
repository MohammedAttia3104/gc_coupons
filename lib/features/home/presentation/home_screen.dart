import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/networks/network_connection_cubit/internet_connection_cubit.dart';
import 'package:gc_coupons/core/networks/no_inetrnet_connection_screen.dart';
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
    return BlocConsumer<InternetConnectionCubit, InternetConnectionState>(
      listener: (context, state) {
        if (state is InternetConnectionDisconnected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NoInternetConnectionScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is InternetConnectionConnected) {
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
                    physics: const NeverScrollableScrollPhysics(),
                    controller:
                        BlocProvider.of<BottomNavBarCubit>(context).controller,
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
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
