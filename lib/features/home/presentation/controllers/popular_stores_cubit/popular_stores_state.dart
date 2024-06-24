part of 'popular_stores_cubit.dart';

@immutable
sealed class PopularStoresState {}

final class PopularStoresInitial extends PopularStoresState {}

final class PopularStoresLoading extends PopularStoresState {}

final class PopularStoresLoaded extends PopularStoresState {
  final List<StoreModel> stores;

  PopularStoresLoaded(this.stores);
}

final class PopularStoresError extends PopularStoresState {
  final String message;

  PopularStoresError(this.message);
}
