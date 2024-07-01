part of 'store_coupons_cubit.dart';

@immutable
sealed class StoreCouponsState {}

final class StoreCouponsInitial extends StoreCouponsState {}


final class StoreCouponsLoading extends StoreCouponsState {}

final class StoreCouponsLoaded extends StoreCouponsState {
  final List<CouponModel> storeCoupons;

  StoreCouponsLoaded(this.storeCoupons);
}

final class StoreCouponsError extends StoreCouponsState {
  final String message;

  StoreCouponsError(this.message);
}

final class ChangeDropDownValue extends StoreCouponsState {
  final String value;

  ChangeDropDownValue(this.value);
}

//filter states
final class FilterCoupons extends StoreCouponsState {
  final List<CouponModel> filteredCoupons;

  FilterCoupons(this.filteredCoupons);
}

final class FilterCouponsError extends StoreCouponsState {
  final String message;

  FilterCouponsError(this.message);
}

final class FilterCouponsLoading extends StoreCouponsState {}

//category
final class SelectCategory extends StoreCouponsState {
  final List<String> selectedCategories;

  SelectCategory(this.selectedCategories);
}

final class DeselectCategory extends StoreCouponsState {
  final List<String> selectedCategories;

  DeselectCategory(this.selectedCategories);
}