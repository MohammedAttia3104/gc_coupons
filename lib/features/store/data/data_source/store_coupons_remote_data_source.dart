import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/core/networks/network_services.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:html_unescape/html_unescape.dart';

abstract class StoreCouponsRemoteDataSource {
  Future<List<CouponModel>> getStoreCoupons(int storeId);

  Future<List<String>> getStoreCategories(int storeId);
}

class StoreCouponsRemoteDataSourceImpl implements StoreCouponsRemoteDataSource {
  final NetworkServices _networkServices;

  StoreCouponsRemoteDataSourceImpl(this._networkServices);

  @override
  Future<List<CouponModel>> getStoreCoupons(int storeId) async {
    Response response = await _networkServices.get(
      ApiConstants.storeCouponsPath,
      queryParameters: {'storeid': storeId},
    );

    if (response.statusCode == 200) {
      List<CouponModel> storeCoupons;
      var data = response.data;
      if (data is String) {
        var unescape = HtmlUnescape();
        data = unescape.convert(data);
        data = jsonDecode(data);
      }
      storeCoupons = (data as List).map((storeCoupon) {
        if (storeCoupon is String) {
          storeCoupon = jsonDecode(storeCoupon);
        }
        if (storeCoupon is Map<String, dynamic>) {
          return CouponModel.fromJson(storeCoupon);
        } else {
          throw Exception('Unexpected coupon data format: $storeCoupon');
        }
      }).toList();
      return storeCoupons;
    } else {
      throw Exception('Failed to load store coupons');
    }
  }

  @override
  Future<List<String>> getStoreCategories(int storeId) async {
    Response response = await _networkServices.get(
      ApiConstants.storeCouponsPath,
      queryParameters: {'storeid': storeId},
    );

    if (response.statusCode == 200) {
      var data = response.data;
      if (data is String) {
        var unescape = HtmlUnescape();
        data = unescape.convert(data);
        data = jsonDecode(data);
      }
      List<String> categories = [];
      for (var storeCoupon in (data as List)) {
        if (storeCoupon is String) {
          storeCoupon = jsonDecode(storeCoupon);
        }
        if (storeCoupon is Map<String, dynamic>) {
          String categoryIds = storeCoupon['category_id'];
          categories.addAll(categoryIds.split(', '));
        } else {
          throw Exception('Unexpected coupon data format: $storeCoupon');
        }
      }
      return categories;
    } else {
      throw Exception('Failed to load store categories');
    }
  }
}
