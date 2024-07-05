import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/core/networks/network_services.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:html_unescape/html_unescape.dart';

abstract class TrendingCouponsRemoteDataSource {
  Future<List<CouponModel>> getTrendingCoupons();
}

class TrendingCouponsRemoteDataSourceImpl
    implements TrendingCouponsRemoteDataSource {
  final NetworkServices _networkServices;

  TrendingCouponsRemoteDataSourceImpl(this._networkServices);

  @override
  Future<List<CouponModel>> getTrendingCoupons() async {
    var response = await _networkServices.get(ApiConstants.popularCouponsPath);

    if (response.statusCode == 200) {
      List<CouponModel> trendingCoupons;
      var data = response.data;
      if (data is String) {
        var unescape = HtmlUnescape();
        data = unescape.convert(data);
        data = jsonDecode(data);
      }
      trendingCoupons = (data as List).map((trendingCoupon) {
        return CouponModel.fromJson(trendingCoupon);
      }).toList();
      return trendingCoupons;
    } else {
      throw Exception('Server Error');
    }
  }
}
