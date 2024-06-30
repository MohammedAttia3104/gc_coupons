part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();
}

final class FavouritesInitial extends FavouritesState {
  @override
  List<Object> get props => [];
}

//add to favourites
final class FavouritesAdded extends FavouritesState {
  final StoreDataModel addedStore;

  const FavouritesAdded(this.addedStore);

  @override
  List<Object> get props => [addedStore];
}

//remove from favourites
final class FavouritesRemoved extends FavouritesState {
  final StoreDataModel deleteStore;

  const FavouritesRemoved(this.deleteStore);

  @override
  List<Object> get props => [deleteStore];
}
