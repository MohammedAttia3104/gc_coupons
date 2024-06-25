import 'package:gc_coupons/core/utils/constants.dart';
import 'package:gc_coupons/features/home/models/trending_model.dart';
import 'package:hive/hive.dart';

abstract class TrendingCouponsLocalDataSource {
  List<TrendingCouponsModel> getCachedTrendingCoupons();
}

class TrendingCouponsLocalDataSourceImpl
    implements TrendingCouponsLocalDataSource {
  @override
  List<TrendingCouponsModel> getCachedTrendingCoupons() {
    Box<TrendingCouponsModel> trendingCoupons =
        Hive.box<TrendingCouponsModel>(kTrendingCouponsBox);
    return trendingCoupons.values.toList();
  }
}
