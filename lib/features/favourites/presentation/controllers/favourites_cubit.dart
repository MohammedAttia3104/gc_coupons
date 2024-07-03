import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/utils/constants.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());

  List<StoreDataModel> favourites = [];

  //object of cubit
  static FavouritesCubit get(context) => BlocProvider.of(context);

  //add to favourite  by store Id
  void addFavourite(StoreDataModel storeModel) {
    favourites.add(storeModel);
    Hive.box<StoreDataModel>(kStoreBox).put(storeModel.storeId, storeModel);
    emit(FavouritesAdded(storeModel.storeId));
  }

  //remove from favourite by store Id
  void removeFavourite(StoreDataModel storeModel) {
    favourites.remove(storeModel);
    Hive.box<StoreDataModel>(kStoreBox).delete(storeModel.storeId);
    emit(FavouritesRemoved(storeModel.storeId));
  }

  //get all favourite stores
  void getFavourites() {
    favourites =
        Hive
            .box<StoreDataModel>(kStoreBox)
            .values
            .toList();
    debugPrint('Favourites all : $favourites');
    emit(FavouritesLoaded(favourites));
  }

  //toggle favourite
  void toggleFavourite(StoreDataModel storeModel) {
    if (favourites.any((store) => store.storeId == storeModel.storeId)) {
      favourites.remove(storeModel);
      debugPrint('Favourites rr: $favourites');
      favourites.removeWhere((store) => store.storeId == storeModel.storeId);
      Hive.box<StoreDataModel>(kStoreBox).delete(storeModel.storeId);
    } else {
      favourites.add(storeModel);
      debugPrint('Favourites aa: $favourites');
      Hive.box<StoreDataModel>(kStoreBox).put(storeModel.storeId, storeModel);
    }
    emit(FavouritesLoaded(favourites));
  }

}