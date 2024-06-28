import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/home/data/data_sources/trending_coupons/trending_coupons_local_data_source.dart';
import 'package:gc_coupons/features/home/data/data_sources/trending_coupons/trending_coupons_remote_data_source.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';

abstract class TrendingCouponsRepository {
  Future<Either<Failure, List<CouponModel>>> getTrendingCoupons();
}

class TrendingCouponsRepositoryImpl implements TrendingCouponsRepository {
  TrendingCouponsRemoteDataSource trendingCouponsDataSource;
  TrendingCouponsLocalDataSource trendingCouponsLocalDataSource;

  TrendingCouponsRepositoryImpl(
      this.trendingCouponsDataSource, this.trendingCouponsLocalDataSource);

  @override
  Future<Either<Failure, List<CouponModel>>>
      getTrendingCoupons() async {
    try {
      List<CouponModel> trendingCoupons;
      trendingCoupons =
          trendingCouponsLocalDataSource.getCachedTrendingCoupons();
      if (trendingCoupons.isNotEmpty) {
        return Right(trendingCoupons);
      }
      trendingCoupons = await trendingCouponsDataSource.getTrendingCoupons();
      return Right(trendingCoupons);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
