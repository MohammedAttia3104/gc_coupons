import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gc_coupons/core/utils/constants.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());

  List<StoreDataModel> favourites = [];

  //add to favourite  by store Id
  void addFavourite(StoreDataModel storeModel) {
    favourites.add(storeModel);
    emit(FavouritesAdded(storeModel.storeId));
    Hive.box<StoreDataModel>(kStoreBox).put(storeModel.storeId, storeModel);
  }

  //remove from favourite by store Id
  void removeFavourite(StoreDataModel storeModel) {
    favourites.remove(storeModel);
    emit(FavouritesRemoved(storeModel.storeId));
    Hive.box<StoreDataModel>(kStoreBox).delete(storeModel.storeId);
  }

  //get all favourite stores
  void getFavourites() {
    final List<StoreDataModel> store = Hive.box<StoreDataModel>(kStoreBox).values.toList();
    favourites = store;
    emit(FavouritesLoaded(store));
  }

  //change favourite icon color throw bool check with button click in store bar
  bool isFavourite = false;

  void changeFavouriteIconColor(StoreDataModel storeModel) {
    if (isFavourite) {
      removeFavourite(storeModel);
      isFavourite = false;
    } else {
      addFavourite(storeModel);
      isFavourite = true;
    }
  }


}
