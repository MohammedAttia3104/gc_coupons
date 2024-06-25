import 'package:gc_coupons/core/utils/constants.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';
import 'package:hive_flutter/adapters.dart';

abstract class PopularStoresLocalDataSource {
  List<StoreModel> getCachedPopularStores();
}

class PopularStoresLocalDataSourceImpl implements PopularStoresLocalDataSource {
  @override
  List<StoreModel> getCachedPopularStores() {
    Box<StoreModel> stores = Hive.box<StoreModel>(kPopularStoresBox);
    return stores.values.toList();
  }
}
