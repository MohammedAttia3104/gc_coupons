import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/features/home/models/trending_model.dart';
import 'package:html_unescape/html_unescape.dart';

abstract class TrendingCouponsRemoteDataSource {
  Future<List<TrendingCouponsModel>> getTrendingCoupons();
}

class TrendingCouponsRemoteDataSourceImpl
    implements TrendingCouponsRemoteDataSource {
  @override
  Future<List<TrendingCouponsModel>> getTrendingCoupons() async {
    var response = await Dio().get(
      ApiConstants.trendingCouponsPath,
      options: Options(
        headers: {
          'Authorization': 'mp0aSI6ImFhN2Y4ZDBhOTVjIiwic2Nvc',
        },
      ),
    );

    if (response.statusCode == 200) {
      List<TrendingCouponsModel> trendingCoupons;
      var data = response.data;
      if (data is String) {
        var unescape = HtmlUnescape();
        data = unescape.convert(data);
        data = jsonDecode(data);
      }
      trendingCoupons = (data as List).map((trendingCoupon) {
        return TrendingCouponsModel.fromJson(trendingCoupon);
      }).toList();
      return trendingCoupons;
    } else {
      throw Exception('Server Error');
    }
  }
}
