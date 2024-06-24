import 'package:gc_coupons/features/home/data/data_sources/popular_stores_data_source.dart';
import 'package:gc_coupons/features/home/data/repositories/popular_stores_repository.dart';
import 'package:gc_coupons/features/home/presentation/controllers/popular_stores_cubit/popular_stores_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<PopularStoresRemoteDataSource>(
        () => PopularStoresRemoteDataSourceImpl());
    sl.registerLazySingleton<PopularStoresRepository>(
        () => PopularStoresRepositoryImpl(sl()));

    sl.registerFactory<PopularStoresCubit>(() => PopularStoresCubit(sl()));
  }
}
