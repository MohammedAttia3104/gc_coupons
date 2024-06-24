import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gc_coupons/features/home/data/repositories/popular_stores_repository.dart';
import 'package:gc_coupons/features/home/models/store_model.dart';

part 'popular_stores_state.dart';

class PopularStoresCubit extends Cubit<PopularStoresState> {
  PopularStoresRepository popularStoresRepository;

  PopularStoresCubit(this.popularStoresRepository)
      : super(PopularStoresInitial());

  void getPopularStores() async {
    emit(PopularStoresLoading());
    final result = await popularStoresRepository.getPopularStores();
    result.fold(
      (error) => emit(PopularStoresError(error)),
      (stores) => emit(PopularStoresLoaded(stores)),
    );
  }
}
