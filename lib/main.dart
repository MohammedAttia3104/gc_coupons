import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/my_bloc_observer.dart';
import 'package:gc_coupons/core/my_navigator_observer.dart';
import 'package:gc_coupons/core/networks/network_connection_cubit/internet_connection_cubit.dart';
import 'package:gc_coupons/core/routers/app_router.dart';
import 'package:gc_coupons/core/routers/routes.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';
import 'package:gc_coupons/features/home/presentation/home_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/constants.dart';
import 'features/home/models/store_model.dart';
import 'features/home/models/trending_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter<StoreModel>(StoreModelAdapter());
  await Hive.openBox<StoreModel>(kPopularStoresBox);
  Hive.registerAdapter<TrendingCouponsModel>(TrendingCouponsModelAdapter());
  await Hive.openBox<TrendingCouponsModel>(kTrendingCouponsBox);
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<InternetConnectionCubit>(
              create: (_) =>
                  InternetConnectionCubit()..monitorInternetConnection(),
            ),
            BlocProvider<CategoryCubit>(
              create: (_) => sl<CategoryCubit>()..getCategories(),
            ),
          ],
          child: MaterialApp(
            navigatorObservers: [MyNavigationObserver()],
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: Routes.homeScreen,
            home: child,
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
