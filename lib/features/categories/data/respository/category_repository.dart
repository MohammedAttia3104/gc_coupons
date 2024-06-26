import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl(this._categoryRemoteDataSource);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await _categoryRemoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
