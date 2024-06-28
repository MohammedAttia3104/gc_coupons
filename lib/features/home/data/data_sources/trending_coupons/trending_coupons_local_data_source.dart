import 'package:gc_coupons/core/utils/constants.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:hive/hive.dart';

abstract class TrendingCouponsLocalDataSource {
  List<CouponModel> getCachedTrendingCoupons();
}

class TrendingCouponsLocalDataSourceImpl
    implements TrendingCouponsLocalDataSource {
  @override
  List<CouponModel> getCachedTrendingCoupons() {
    Box<CouponModel> trendingCoupons =
        Hive.box<CouponModel>(kTrendingCouponsBox);
    return trendingCoupons.values.toList();
  }
}
