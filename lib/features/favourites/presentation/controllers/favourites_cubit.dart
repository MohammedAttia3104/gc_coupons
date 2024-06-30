import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());


  List<StoreDataModel> store = [];

  // void changeFavouriteIconColor(bool isFavourite) {
  //   if (isFavourite) {
  //     store.add()
  //     emit(FavouritesAdded());
  //   } else {
  //     emit(FavouritesRemoved());
  //   }
  // }

  void addFavourite(StoreDataModel storeData) {
    store.add(storeData);
    emit(FavouritesAdded(storeData));
  }

  void removeFavourite(StoreDataModel storeData) {
    store.remove(storeData);
    emit(FavouritesRemoved(storeData));
  }
}
