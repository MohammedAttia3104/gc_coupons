import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

abstract class StoreRemoteDataSource {
  Future<StoreDataModel> getStoreData(int storeId);
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  @override
  Future<StoreDataModel> getStoreData(int storeId) async {
    Response response = await Dio().get(
      ApiConstants.storeDataPath,
      queryParameters: {'storeid': storeId},
      options: Options(
        headers: {
          //Todo : Refactor Later
          'Authorization': 'mp0aSI6ImFhN2Y4ZDBhOTVjIiwic2Nvc',
        },
      ),
    );
    //debugPrint('StoreData: ${response.data}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      if (data is List) {
        data = data[0];
      }
      data['store_id'] = int.parse(data['store_id']);
      return StoreDataModel.fromJson(data);
    } else {
      throw Exception('Failed to load store data');
    }
  }
}
