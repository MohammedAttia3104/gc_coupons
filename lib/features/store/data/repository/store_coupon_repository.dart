import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/store/data/data_source/store_coupons_remote_data_source.dart';

abstract class StoreCouponsRepository {
  Future<Either<Failure, List<CouponModel>>> getStoreCoupons(int storeId);
}

class StoreCouponsRepositoryImpl implements StoreCouponsRepository {
  StoreCouponsRemoteDataSource storeCouponsRemoteDataSource;

  StoreCouponsRepositoryImpl(this.storeCouponsRemoteDataSource);

  @override
  Future<Either<Failure, List<CouponModel>>> getStoreCoupons(
      int storeId) async {
    try {
      final storeCoupons =
          await storeCouponsRemoteDataSource.getStoreCoupons(storeId);
      return Right(storeCoupons);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
