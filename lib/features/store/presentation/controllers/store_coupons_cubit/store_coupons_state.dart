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
final class FilterCouponsSuccess extends StoreCouponsState {
  final List<CouponModel> filteredCoupons;

  FilterCouponsSuccess(this.filteredCoupons);
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

final class CategorySelectionChanged extends StoreCouponsState {
  final List<String> selectedCategories;

  CategorySelectionChanged(this.selectedCategories);
}

final class StoreCategoriesLoading extends StoreCouponsState {}

final class StoreCategoriesLoaded extends StoreCouponsState {
  final List<String> storeCategories;

  StoreCategoriesLoaded(this.storeCategories);
}

final class StoreCategoriesError extends StoreCouponsState {
  final String message;

  StoreCategoriesError(this.message);
}

final class StoreCategoriesFilteredLoading extends StoreCouponsState {}

final class StoreCategoriesFilteredLoaded extends StoreCouponsState {
  final List<CategoryModel> storeCategories;

  StoreCategoriesFilteredLoaded(this.storeCategories);
}

final class StoreCategoriesFilteredError extends StoreCouponsState {
  final String message;

  StoreCategoriesFilteredError(this.message);
}

class StoreSpecificCategoriesLoaded extends StoreCouponsState {
  final List<CategoryModel> categories;
  StoreSpecificCategoriesLoaded(this.categories);
}