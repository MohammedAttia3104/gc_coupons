import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/home/data/data_sources/popular_stores_data_source.dart';
import 'package:gc_coupons/features/home/data/data_sources/popular_stores_local_data_source.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';

abstract class PopularStoresRepository {
  Future<Either<Failure, List<StoreModel>>> getPopularStores();
}

class PopularStoresRepositoryImpl implements PopularStoresRepository {
  PopularStoresRemoteDataSource popularStoresDataSource;
  PopularStoresLocalDataSource popularStoresLocalDataSource;

  PopularStoresRepositoryImpl(
      this.popularStoresDataSource, this.popularStoresLocalDataSource);

  @override
  Future<Either<Failure, List<StoreModel>>> getPopularStores() async {
    try {
      List<StoreModel> stores;
      stores = popularStoresLocalDataSource.getCachedPopularStores();
      if (stores.isNotEmpty) {
        return Right(stores);
      }
      stores = await popularStoresDataSource.getPopularStores();
      return Right(stores);
    } catch (e) {
      return Left(ServerFailure(e.toString()));

      ///TODO: handle errors again
    }
  }
}
