import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/home/data/data_sources/popular_stores_data_source.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';

abstract class PopularStoresRepository {
  Future<Either<Failure, List<StoreModel>>> getPopularStores();
}

class PopularStoresRepositoryImpl implements PopularStoresRepository {
  PopularStoresRemoteDataSource popularStoresDataSource;

  PopularStoresRepositoryImpl(this.popularStoresDataSource);

  @override
  Future<Either<Failure, List<StoreModel>>> getPopularStores() async {
    final List<StoreModel> stores =
        await popularStoresDataSource.getPopularStores();
    try {
      return Right(stores);
    } catch (e) {
      return Left(ServerFailure(e.toString()));

      ///TODO: handle errors again
    }
  }
}
