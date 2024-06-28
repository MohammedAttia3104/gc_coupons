import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/store/data/data_source/store_remote_data_source.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

abstract class StoreDataRepository {
  Future<Either<Failure, StoreDataModel>> getStoreData(int storeId);
}

class StoreDataRepositoryImpl implements StoreDataRepository {
  StoreRemoteDataSource storeRemoteDataSource;

  StoreDataRepositoryImpl(this.storeRemoteDataSource);

  @override
  Future<Either<Failure, StoreDataModel>> getStoreData(int storeId) async {
    try {
      final storeData = await storeRemoteDataSource.getStoreData(storeId );
      return Right(storeData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
