import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/exceptions.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/search/data/data_source/search_remote_data_source.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<StoreDataModel>>> getLiveSearch(String storeName);
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<StoreDataModel>>> getLiveSearch(
      String storeName) async {
    try {
      final storeData = await searchRemoteDataSource.getLiveSearch(storeName);
      return Right(storeData);
    } on ServerException {
      return Left(ServerFailure(e.toString()));
    }
  }
}
