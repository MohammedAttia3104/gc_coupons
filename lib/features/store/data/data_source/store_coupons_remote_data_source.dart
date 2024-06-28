import 'package:gc_coupons/features/home/models/coupon_model.dart';

abstract class StoreCouponsRemoteDataSource {
  Future<List<CouponModel>> getStoreCoupons();
}