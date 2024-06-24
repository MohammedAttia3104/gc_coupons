import 'package:dartz/dartz.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';

abstract class StoreRepository {
  Future<Either<String, List<StoreModel>>> getStores();
}
