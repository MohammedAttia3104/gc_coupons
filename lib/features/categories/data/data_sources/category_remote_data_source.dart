import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gc_coupons/core/errors/exceptions.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/core/networks/error_message_model.dart';
import 'package:gc_coupons/core/networks/network_services.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final NetworkServices _networkServices;

  CategoryRemoteDataSourceImpl(this._networkServices);

  @override
  Future<List<CategoryModel>> getCategories() async {
    var response = await _networkServices.get(ApiConstants.categoryDataPath );

    if (response.statusCode == 200) {
      var data = response.data;
      if (data is String) {
        data = jsonDecode(data);
      }
      List<CategoryModel> categories = (data as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList();
      return categories;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(message: 'Server Error'),
      );
    }
  }
}
