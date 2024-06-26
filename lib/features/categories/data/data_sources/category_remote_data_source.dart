import 'package:dio/dio.dart';
import 'package:gc_coupons/core/errors/exceptions.dart';
import 'package:gc_coupons/core/networks/api_constants.dart';
import 'package:gc_coupons/core/networks/error_message_model.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    var response = await Dio().get(ApiConstants.categoryDataPath,
        options: Options(headers: {
          'Authorization': 'mp0aSI6ImFhN2Y4ZDBhOTVjIiwic2Nvc',
        }));
    if (response.statusCode == 200) {
      List<CategoryModel> categories = (response.data as List)
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
