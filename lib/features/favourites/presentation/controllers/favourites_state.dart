part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();
}

final class FavouritesInitial extends FavouritesState {
  @override
  List<Object> get props => [];
}

//add to favourite  by store Id
final class FavouritesAdded extends FavouritesState {
  final int storeId;

  const FavouritesAdded(this.storeId);

  @override
  List<Object> get props => [storeId];
}

//remove from favourite by store Id
final class FavouritesRemoved extends FavouritesState {
  final int storeId;

  const FavouritesRemoved(this.storeId);

  @override
  List<Object> get props => [storeId];
}

//get all favourite stores
final class FavouritesLoaded extends FavouritesState {
  final List<StoreDataModel> store;

  const FavouritesLoaded(this.store);

  @override
  List<Object> get props => [store];
}