part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class StoreLoading extends StoreState {}

final class StoreLoaded extends StoreState {
  final StoreDataModel storeDataModel;

  StoreLoaded(this.storeDataModel);
}

final class StoreError extends StoreState {
  final String message;

  StoreError(this.message);
}

// final class ChangeDropDownValue extends StoreState {
//   final String value;
//
//   ChangeDropDownValue(this.value);
// }
