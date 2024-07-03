part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();
}

final class FavouritesInitial extends FavouritesState {
  @override
  List<Object> get props => [];
}

// State for when a store is added to favorites by storeId
final class FavouritesAdded extends FavouritesState {
  final int storeId;

  const FavouritesAdded(this.storeId);

  @override
  List<Object> get props => [storeId];
}

// State for when a store is removed from favorites by storeId
final class FavouritesRemoved extends FavouritesState {
  final int storeId;

  const FavouritesRemoved(this.storeId);

  @override
  List<Object> get props => [storeId];
}

// State for when the list of favorite stores is loaded or updated
final class FavouritesLoaded extends FavouritesState {
  final List<StoreDataModel> store;

  const FavouritesLoaded(this.store);

  @override
  List<Object> get props => [store];
}

