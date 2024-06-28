import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<StoreDataModel>> getLiveSearch(String storeName);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  @override
  Future<List<StoreDataModel>> getLiveSearch(String storeName) async {
    Response response = await Dio().get(
      ApiConstants.liveSearchPath,
      queryParameters: {'query': storeName},
      options: Options(
        headers: {
          'Authorization': 'mp0aSI6ImFhN2Y4ZDBhOTVjIiwic2Nvc',
        },
      ),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      List<StoreDataModel> storeDataModels = [];

      if (data is List) {
        for (var item in data) {
          storeDataModels.add(StoreDataModel.fromJson(item));
        }
      } else {
        throw Exception('Unexpected store data format: $data');
      }
      return storeDataModels;
    } else {
      throw Exception('Failed to load store data');
    }
  }
}
