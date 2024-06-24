import 'package:dio/dio.dart';
import 'package:gc_coupons/core/errors/exceptions.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/core/networks/error_message_model.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';

abstract class PopularStoresRemoteDataSource {
  Future<List<StoreModel>> getPopularStores();
}

class PopularStoresRemoteDataSourceImpl implements PopularStoresRemoteDataSource {
  @override
  Future<List<StoreModel>> getPopularStores() async {
    Response response =
        await Dio().get(ApiConstants.baseUrl + ApiConstants.popularStores);
    if (response.statusCode == 200) {
      List<StoreModel> stores = (response.data as List)
          .map((store) => StoreModel.fromJson(store))
          .toList();
      return stores;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(message: 'Server Error'),
      );
    }
  }
}
