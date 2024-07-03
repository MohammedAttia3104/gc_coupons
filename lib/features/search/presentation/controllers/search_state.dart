part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<StoreDataModel> storeData;

  SearchSuccess(this.storeData);
}

final class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

//No Matched Stores Found
final class NoMatchedStoresFound extends SearchState {}
