import 'package:dio/dio.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/features/home/models/trending_model.dart';

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
      trendingCoupons = (response.data as List).map((trendingCoupon) {
        return TrendingCouponsModel.fromJson(trendingCoupon);
      }).toList();
      return trendingCoupons;
    } else {
      throw Exception('Server Error');
    }
  }
}
