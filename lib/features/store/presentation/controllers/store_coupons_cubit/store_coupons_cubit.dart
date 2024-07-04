import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc_coupons/features/categories/data/respository/category_repository.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/store/data/repository/store_coupon_repository.dart';

part 'store_coupons_state.dart';

class StoreCouponsCubit extends Cubit<StoreCouponsState> {
  StoreCouponsRepository storeCouponsRepository;

  // CategoryRepository categoryRepository;

  StoreCouponsCubit(this.storeCouponsRepository) : super(StoreCouponsInitial());

  List<CouponModel> storeCoupons = [];

  void getStoreCoupons(int storeId) async {
    emit(StoreCouponsLoading());
    final storeCoupons = await storeCouponsRepository.getStoreCoupons(storeId);
    storeCoupons.fold(
      (failure) {
        debugPrint('StoreCouponsError: ${failure.message}');
        emit(StoreCouponsError(failure.message));
      },
      (storeCoupons) {
        debugPrint('StoreCoupons: $storeCoupons');
        emit(StoreCouponsLoaded(storeCoupons));
      },
    );
  }

  /// cache store coupons , then from it filter data

//selected value of drop down button
  String dropDownValue = 'All';
  List<String> dropDownValues = ['All', 'Coupons', 'Deals'];

  //change value of drop down button and return current value
  //update DropDown value
  void changeDropDownValue(String value) {
    dropDownValue = value;
    debugPrint('DropDownValue: $dropDownValue');
    emit(ChangeDropDownValue(value));
  }

  List<String> selectedCategories = [];

  void selectCategory(CategoryModel category) {
    selectedCategories.add(category.id);
    debugPrint('Added to SelectedCategories: $selectedCategories');
    emit(SelectCategory(selectedCategories));
  }

  void deselectCategory(CategoryModel category) {
    selectedCategories.remove(category.id);
    debugPrint('Removed From SelectedCategories: $selectedCategories');
    emit(DeselectCategory(selectedCategories));
  }

  void toggleCategorySelection(CategoryModel category) {
    if (selectedCategories.contains(category.id)) {
      selectedCategories.remove(category.id);
      debugPrint('Removed From SelectedCategories: $selectedCategories');
    } else {
      selectedCategories.add(category.id);
      debugPrint('Added to SelectedCategories: $selectedCategories');
    }
    emit(CategorySelectionChanged(selectedCategories));
  }

  Future<List<String>?>getStoreCategories(int storeId) async {
    final storeCategories =
        await storeCouponsRepository.getStoreCategories(storeId);
    storeCategories.fold(
      (failure) {
        debugPrint('StoreCategoriesError: ${failure.message}');
        emit(StoreCouponsError(failure.message));
        return [];
      },
      (categories) {
        debugPrint('StoreCategories: $categories');
        emit(StoreCategoriesLoaded(categories));
        return  categories;
      },
    );
    return null;
  }

  // get store categories filtered by store id from all  categories
  // match with filtered states
  // Future<void> getFilteredStoreCategories(int storeId) async {
  //   emit(StoreCategoriesLoading());
  //   try {
  //     final result = await categoryRepository.getCategories();
  //     result.fold(
  //       (failure) {
  //         debugPrint('StoreCategoriesError: ${failure.message}');
  //         emit(StoreCategoriesFilteredError(failure.toString()));
  //       },
  //       (categories) {
  //         final filteredCategories = categories
  //             .where((category) => category.id.contains(storeId.toString()))
  //             .toList();
  //         debugPrint('Filtered Store Categories: $filteredCategories');
  //         emit(StoreCategoriesLoaded(filteredCategories));
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint('GetFilteredStoreCategoriesError: $e');
  //     emit(StoreCategoriesError(e.toString()));
  //   }
  // }

  //filter coupons based on selected categories and drop down value and return filtered coupons by store id
  Future<void> filterCoupons(int storeId) async {
    emit(FilterCouponsLoading());
    try {
      // Always fetch the latest coupons from the repository
      final result = await storeCouponsRepository.getStoreCoupons(storeId);
      result.fold(
        (failure) {
          debugPrint('StoreCouponsError: ${failure.message}');
          emit(StoreCouponsError(failure.message));
        },
        (coupons) {
          storeCoupons =
              coupons; // Update the storeCoupons list with the latest data
          List<CouponModel> filteredCoupons =
              List.from(storeCoupons); // Start with all coupons
          debugPrint('StoreCoupons: $storeCoupons');
          // Apply dropDownValue filter
          if (dropDownValue != 'All') {
            final isCoupon = dropDownValue == 'Coupons';
            filteredCoupons = filteredCoupons.where((coupon) {
              return (isCoupon ? coupon.ctype == '1' : coupon.ctype == '3');
            }).toList();
          }

          // Apply selectedCategories filter
          if (selectedCategories.isNotEmpty) {
            filteredCoupons = filteredCoupons.where((coupon) {
              return selectedCategories.contains(coupon.categoryId);
            }).toList();
          }
          emit(FilterCouponsSuccess(filteredCoupons));
        },
      );
    } catch (e) {
      debugPrint('FilterCouponsError: $e');
      emit(FilterCouponsError(e.toString()));
    }
  }
}
