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

  // List<StoreDataModel> storeData = [];
  // List<StoreDataModel> filteredData = [];
  // TextEditingController searchController = TextEditingController();
  //
  // @override
  // Future<void> close() {
  //   searchController.dispose();
  //   return super.close();
  // }

  void getSearchData({required String searchQuery}) async {
    emit(SearchLoading());

    try {
      Either<Failure, List<StoreDataModel>> storeData =
          await searchRepository.getLiveSearch(searchQuery);
      debugPrint('storeData: $storeData');
      emit(SearchSuccess(storeData as List<StoreDataModel>));
    } catch (e) {
      debugPrint('Search Error: $e');
      emit(SearchError(e.toString()));
    }
  }

// List<StoreDataModel> getFilteredData(String storeName) {
//   return storeData.where((element) {
//     return element.storeName.toLowerCase().startsWith(storeName);
//   }).toList();
// }
}
