import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/store/data/repository/store_data_repository.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreDataRepository storeDataRepository;

  StoreCubit(this.storeDataRepository) : super(StoreInitial());

  //object of cubit
  static StoreCubit of(BuildContext context) => BlocProvider.of<StoreCubit>(context);

  void getStoreData(int storeId) async {
    emit(StoreLoading());
    final Either<Failure, StoreDataModel> storeDataOrFailure =
        await storeDataRepository.getStoreData(storeId);
    storeDataOrFailure.fold(
      (failure) {
        emit(StoreError(failure.toString()));
      },
      (storeData) {
        emit(StoreLoaded(storeData));
      },
    );
  }

  void changeFavouriteIconColor(bool isFavourite) {
    if (isFavourite) {
      emit(AddFavouriteStore(true));
    } else {
      emit(RemoveFavouriteStore(false));
    }
  }

  //selected value of drop down button
  String selectedValue = 'All';

  List<String> dropDownValues = ['All', 'Coupons', 'Deals'];

  void changeDropDownValue(String value) {
    selectedValue = value;
    emit(ChangeDropDownValue(value));
  }
}
