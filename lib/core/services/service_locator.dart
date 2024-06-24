import 'package:gc_coupons/features/home/data/datasources/popular_stores_data_source.dart';
import 'package:gc_coupons/features/home/data/repositories/store_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<PopularStoresRemoteDataSource>(
        () => PopularStoresRemoteDataSourceImpl());
    sl.registerLazySingleton<PopularStoreRepository>(
        () => PopularStoresRepositoryImpl(sl()));

  }
}
