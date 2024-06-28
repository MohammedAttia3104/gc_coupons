import 'package:gc_coupons/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:gc_coupons/features/categories/data/respository/category_repository.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';
import 'package:gc_coupons/features/home/data/data_sources/popular_stores/popular_stores_remote_data_source.dart';
import 'package:gc_coupons/features/home/data/data_sources/popular_stores/popular_stores_local_data_source.dart';
import 'package:gc_coupons/features/home/data/data_sources/trending_coupons/trending_coupons_local_data_source.dart';
import 'package:gc_coupons/features/home/data/repositories/popular_stores_repository.dart';
import 'package:gc_coupons/features/home/data/repositories/trending_coupons_repository.dart';
import 'package:gc_coupons/features/home/presentation/controllers/popular_stores_cubit/popular_stores_cubit.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:gc_coupons/features/store/data/data_source/store_coupons_remote_data_source.dart';
import 'package:gc_coupons/features/store/data/data_source/store_remote_data_source.dart';
import 'package:gc_coupons/features/store/data/repository/store_coupon_repository.dart';
import 'package:gc_coupons/features/store/data/repository/store_data_repository.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/trending_coupons/trending_coupons_remote_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<PopularStoresRemoteDataSource>(
        () => PopularStoresRemoteDataSourceImpl());
    sl.registerLazySingleton<PopularStoresLocalDataSource>(
        () => PopularStoresLocalDataSourceImpl());
    sl.registerLazySingleton<PopularStoresRepository>(
        () => PopularStoresRepositoryImpl(sl(), sl()));

    sl.registerFactory<PopularStoresCubit>(() => PopularStoresCubit(sl()));

    //Trending Coupons
    sl.registerLazySingleton<TrendingCouponsRemoteDataSource>(
        () => TrendingCouponsRemoteDataSourceImpl());

    sl.registerLazySingleton<TrendingCouponsLocalDataSource>(
      () => TrendingCouponsLocalDataSourceImpl(),
    );
    sl.registerLazySingleton<TrendingCouponsRepository>(
        () => TrendingCouponsRepositoryImpl(
              sl(),
              sl(),
            ));

    sl.registerFactory<TrendingCouponsCubit>(() => TrendingCouponsCubit(sl()));

    //Categories
    sl.registerLazySingleton<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl());

    sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(sl()));
    sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl()));

    //store data
    sl.registerLazySingleton<StoreRemoteDataSource>(
        () => StoreRemoteDataSourceImpl());
    sl.registerLazySingleton<StoreDataRepository>(
        () => StoreDataRepositoryImpl(sl()));
    sl.registerFactory<StoreCubit>(() => StoreCubit(sl()));

    sl.registerLazySingleton<StoreCouponsRemoteDataSource>(
      () => StoreCouponsRemoteDataSourceImpl(),
    );
    sl.registerLazySingleton<StoreCouponsRepository>(
      () => StoreCouponsRepositoryImpl(sl()),
    );
    sl.registerFactory<StoreCouponsCubit>(() => StoreCouponsCubit(sl()));
  }
}
