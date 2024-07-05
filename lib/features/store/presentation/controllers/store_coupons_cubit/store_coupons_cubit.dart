import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc_coupons/features/categories/data/respository/category_repository.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/store/data/repository/store_coupon_repository.dart';

part 'store_coupons_state.dart';

class StoreCouponsCubit extends Cubit<StoreCouponsState> {
  StoreCouponsRepository storeCouponsRepository;

  CategoryRepository categoryRepository;

  StoreCouponsCubit(this.storeCouponsRepository, this.categoryRepository)
      : super(StoreCouponsInitial());

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

  // void selectCategory(CategoryModel category) {
  //   selectedCategories.add(category.id);
  //   debugPrint('Added to SelectedCategories: $selectedCategories');
  //   emit(SelectCategory(selectedCategories));
  // }
  //
  // void deselectCategory(CategoryModel category) {
  //   selectedCategories.remove(category.id);
  //   debugPrint('Removed From SelectedCategories: $selectedCategories');
  //   emit(DeselectCategory(selectedCategories));
  // }

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

  // Future<void> getStoreCategories(int storeId) async {
  //   emit(StoreCategoriesLoading());
  //   try {
  //     final storeCategories =
  //         await storeCouponsRepository.getStoreCategories(storeId);
  //     storeCategories.fold(
  //       (failure) {
  //         debugPrint('StoreCategoriesError: ${failure.message}');
  //         emit(StoreCategoriesError(failure.message));
  //       },
  //       (categories) {
  //         final uniqueCategories = categories.toSet().toList();
  //         debugPrint('Unique Store Categories: $uniqueCategories');
  //         emit(StoreCategoriesLoaded(uniqueCategories));
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint('get store categories error >> : ${e.toString()}');
  //   }
  // }

  // Delete
  // Future<void> getFilteredStoreCategories(int storeId) async {
  //   emit(StoreCategoriesLoading());
  //   try {
  //     // Fetch all categories
  //     final allCategoriesResult = await categoryRepository.getCategories();
  //     List<CategoryModel> allCategories = [];
  //     allCategoriesResult.fold(
  //       (failure) => throw Exception(failure.message),
  //       (categories) => allCategories = categories,
  //     );
  //
  //     // Fetch store-specific category IDs
  //     final storeCategoriesResult =
  //         await storeCouponsRepository.getStoreCategories(storeId);
  //     List<String> storeCategoryIds = [];
  //     storeCategoriesResult.fold(
  //       (failure) => throw Exception(failure.message),
  //       (categories) {
  //         storeCategoryIds = categories.toSet().toList();
  //         debugPrint('StoreCategoryIds >>> Unique >> : $storeCategoryIds');
  //         debugPrint('StoreCategoryIds >>> Unique >> Len >>>> : ${storeCategoryIds.length}');
  //         return storeCategoryIds;
  //       },
  //     );
  //
  //     // Filter all categories to include only those that are specific to the store
  //     final filteredCategories = allCategories
  //         .where((category) => storeCategoryIds.contains(category.id))
  //         .toList();
  //     debugPrint('Filtered Store Categories: $filteredCategories');
  //     debugPrint('Filtered Store Categories Len >>>> : ${filteredCategories.length}');
  //     emit(StoreSpecificCategoriesLoaded(filteredCategories));
  //   } catch (e) {
  //     debugPrint('get filtered store categories error >> : ${e.toString()}');
  //     emit(StoreCategoriesError(e.toString()));
  //   }
  // }

  // Future<void> getFilteredStoreCategories(int storeId) async {
  //   emit(StoreCategoriesLoading());
  //   try {
  //     // Fetch all categories
  //     final allCategoriesResult = await categoryRepository.getCategories();
  //     List<CategoryModel> allCategories = [];
  //     allCategoriesResult.fold(
  //       (failure) => throw Exception(failure.message),
  //       (categories) => allCategories = categories,
  //     );
  //
  //     // Fetch store-specific category IDs
  //     final storeCategoriesResult =
  //         await storeCouponsRepository.getStoreCategories(storeId);
  //     List<String> storeCategoryIds = [];
  //     storeCategoriesResult.fold(
  //       (failure) => throw Exception(failure.message),
  //       (categories) {
  //         // Ensuring uniqueness of IDs for debugging
  //         storeCategoryIds = categories.toSet().toList();
  //         debugPrint('StoreCategoryIds >>> Unique >> : $storeCategoryIds');
  //         debugPrint(
  //             'StoreCategoryIds >>> Unique >> Len >>>> : ${storeCategoryIds.length}');
  //         return storeCategoryIds;
  //       },
  //     );
  //
  //     // Debug: Print all category IDs for comparison
  //     debugPrint(
  //         'All Category IDs: ${allCategories.map((c) => c.id).toList()}');
  //
  //     // Filter all categories to include only those that are specific to the store
  //     // loop through all categories and check if the category id is in storeCategoryIds
  //
  //     final filteredCategories = allCategories
  //         .where((category) => storeCategoryIds.contains(category.id))
  //         .toList();
  //     debugPrint(
  //         '[[[[[[[[[[[[[[[[[Filtered Store Categories]]]]]]]]]]]]]]]]: $filteredCategories');
  //     debugPrint(
  //         'Filtered Store Categories Len >>>> : ${filteredCategories.length}');
  //
  //     // Debug: Check for any IDs in storeCategoryIds not found in allCategories
  //     final missingCategories = storeCategoryIds
  //         .where((id) => !allCategories.any((category) => category.id == id))
  //         .toList();
  //     if (missingCategories.isNotEmpty) {
  //       debugPrint('Missing Category IDs: $missingCategories');
  //     }
  //
  //     emit(StoreSpecificCategoriesLoaded(filteredCategories));
  //   } catch (e) {
  //     debugPrint('get filtered store categories error >> : ${e.toString()}');
  //     emit(StoreCategoriesError(e.toString()));
  //   }
  // }

  Future<void> getFilteredStoreCategories(int storeId) async {
    emit(StoreCategoriesLoading());
    try {
      // Fetch all categories
      final allCategoriesResult = await categoryRepository.getCategories();
      List<CategoryModel> allCategories = [];
      allCategoriesResult.fold(
        (failure) => throw Exception(failure.message),
        (categories) => allCategories = categories,
      );

      // Fetch store-specific category IDs
      final storeCategoriesResult =
          await storeCouponsRepository.getStoreCategories(storeId);
      Set<String> storeCategoryIds = {};
      storeCategoriesResult.fold(
        (failure) => throw Exception(failure.message),
        (categories) {
          debugPrint('Original Categories >>>>> $categories');
          debugPrint('Original Categories >>>>> Len >>>>>. ${categories.length}');
          storeCategoryIds = categories.toSet();
          debugPrint('StoreCategoryIds >>> Unique >> : $storeCategoryIds');
          debugPrint(
              'StoreCategoryIds >>> Unique >> Len >>>> : ${storeCategoryIds.length}');
          return storeCategoryIds;
        },
      );

      List<CategoryModel> filteredCategories = [];
      for (String id in storeCategoryIds) {
        try {
          List<CategoryModel> category = allCategories.where(
            (element) {
              // List<String> val = id.replaceFirst(" ", "").split(',').toList();
              // debugPrint('val string >>> $val');
              // TODO: Problem HERE
              return element.id == id;
            },
          ).toList();
          if (category.isNotEmpty) {
            filteredCategories.add(category.first);
          }
          debugPrint(
              '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   $id >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        } catch (e) {
          // If no category is found, it skips adding it to the list, thus avoiding null.
        }
      }

      debugPrint('Filtered Store Categories: $filteredCategories');
      debugPrint(
          'Filtered Store Categories Len >>>> : ${filteredCategories.length}');

      emit(StoreSpecificCategoriesLoaded(filteredCategories));
    } catch (e) {
      debugPrint('get filtered store categories error >> : ${e.toString()}');
      emit(StoreCategoriesError(e.toString()));
    }
  }

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
          debugPrint('StoreCoupons*********************: $storeCoupons');
          // Apply dropDownValue filter
          if (dropDownValue != 'All') {
            final isCoupon = dropDownValue == 'Coupons';
            filteredCoupons = filteredCoupons.where((coupon) {
              return (isCoupon ? coupon.ctype == '1' : coupon.ctype == '3');
            }).toList();
            debugPrint('is coupon Filtered Coupons: $filteredCoupons');
          }

          ///ToDo : Here
          // Apply selectedCategories filter
          if (selectedCategories.isNotEmpty) {
            filteredCoupons = filteredCoupons.where((coupon) {
              return selectedCategories.contains(coupon.categoryId);
            }).toList();
            debugPrint(
                'Selected Categories Filtered Coupons: $filteredCoupons');
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
