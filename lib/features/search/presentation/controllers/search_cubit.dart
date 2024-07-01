import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/search/data/repository/search_repository.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository searchRepository;

  SearchCubit(this.searchRepository) : super(SearchInitial());

  //object of BlocProvider
  static SearchCubit of(BuildContext context) =>
      BlocProvider.of<SearchCubit>(context);

  List<StoreDataModel> storeData = [];

  void getSearchData({required String searchQuery}) async {
    // if (searchQuery.isEmpty) return;
    try {
      emit(SearchLoading());
      final Either<Failure, List<StoreDataModel>> response =
          await searchRepository.getLiveSearch(searchQuery);
      response.fold(
        (failure) {
          // debugPrint('Search Failure: ${failure.message}');
          emit(SearchError(failure.message));
        },
        (storeData) {
          this.storeData = storeData;
          // for (var store in storeData) {
          //   debugPrint('StoreDataModelImage: ${store.storeImage}');
          // }
          emit(SearchSuccess(storeData));
        },
      );
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
