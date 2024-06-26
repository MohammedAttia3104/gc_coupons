import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/features/home/data/repositories/popular_stores_repository.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';

part 'popular_stores_state.dart';

class PopularStoresCubit extends Cubit<PopularStoresState> {
  PopularStoresRepository popularStoresRepository;

  PopularStoresCubit(this.popularStoresRepository)
      : super(PopularStoresInitial());

  //object of the store model
  static PopularStoresCubit get(context) => BlocProvider.of(context);

  List<StoreModel>? stores;

  void getPopularStores() async {
    emit(PopularStoresLoading());
    final result = await popularStoresRepository.getPopularStores();
    result.fold(
      (error) => emit(PopularStoresError(error.message)),
      (stores) => emit(PopularStoresLoaded(stores)),
    );
  }
}
