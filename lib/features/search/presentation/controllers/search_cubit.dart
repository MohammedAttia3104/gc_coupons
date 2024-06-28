import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:gc_coupons/core/errors/failure.dart';
import 'package:gc_coupons/features/search/data/repository/search_repository.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository searchRepository;

  SearchCubit(this.searchRepository) : super(SearchInitial());

  void search(String storeName) async {
    emit(SearchLoading());
    try {
      final Either<Failure, List<StoreDataModel>> storeData =
          await searchRepository.getLiveSearch(storeName);
      emit(SearchSuccess(storeData as List<StoreDataModel>));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
