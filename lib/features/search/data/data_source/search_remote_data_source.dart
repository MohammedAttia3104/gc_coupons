import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
        for (var element in data) {
          int storeId;
          if (element['store_id'] is String) {
            try {
              storeId = int.parse(element['store_id']);
            } catch (e) {
              storeId = -1; // Or any other suitable default
              print("Error parsing store_id: $e");
            }
          } else {
            storeId = element['store_id'];
          }
          storeDataModels.add(StoreDataModel.fromJson({
            ...element,
            'store_id': storeId,
            'image_url': element['image_url'] ?? '',
          }));
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
