import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
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
import 'package:gc_coupons/features/favourites/presentation/controllers/favourites_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/popular_stores_cubit/popular_stores_cubit.dart';
import 'package:gc_coupons/features/home/presentation/home_screen.dart';
import 'package:gc_coupons/features/search/presentation/controllers/search_cubit.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/constants.dart';
import 'features/home/models/store_model.dart';
import 'features/home/models/coupon_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter<StoreModel>(StoreModelAdapter());
  await Hive.openBox<StoreModel>(kPopularStoresBox);
  Hive.registerAdapter<CouponModel>(CouponModelAdapter());
  await Hive.openBox<CouponModel>(kTrendingCouponsBox);
  Hive.registerAdapter<StoreDataModel>(StoreDataModelAdapter());
  await Hive.openBox<StoreDataModel>(kStoreBox);
  ServiceLocator().init();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp(),
  );
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
            BlocProvider<StoreCouponsCubit>(
              create: (_) => sl<StoreCouponsCubit>()
                 ..filterCoupons(
            
                ),
            ),
            BlocProvider<CategoryCubit>(
              create: (_) => sl<CategoryCubit>()..getCategories(),
            ),
            BlocProvider<PopularStoresCubit>(
              create: (_) => sl<PopularStoresCubit>()..getPopularStores(),
            ),
            BlocProvider(
              create: (context) => FavouritesCubit()..getFavourites(),
            ),
          ],
          child: MaterialApp(
            /// device preview
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            ///
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
