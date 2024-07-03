import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/store/data/repository/store_coupon_repository.dart';

part 'store_coupons_state.dart';

class StoreCouponsCubit extends Cubit<StoreCouponsState> {
  StoreCouponsRepository storeCouponsRepository;

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

  //filter coupons based on selected categories and drop down value and return filtered coupons by store id
  Future<List<CouponModel>> filterCoupons(int storeId) async {
    emit(FilterCouponsLoading());
    try {
      if (dropDownValue == 'All') {
        emit(FilterCouponsSuccess(storeCoupons));
        return storeCoupons;
      } else if (dropDownValue == 'Coupons') {
        storeCoupons = storeCoupons.where((element) {
          return element.ctype == '1' &&
              selectedCategories.contains(element.categoryId);
        }).toList();
        debugPrint('FilterCouponsSuccessX: $storeCoupons');
        emit(FilterCouponsSuccess(storeCoupons));
        return storeCoupons;
      } else {
        emit(FilterCouponsSuccess(storeCoupons));
        storeCoupons = storeCoupons.where((element) {
          return element.ctype == '3' &&
              selectedCategories.contains(element.categoryId);
        }).toList();
        debugPrint('FilterCouponsSuccessY: $storeCoupons');
        emit(FilterCouponsSuccess(storeCoupons));
        return storeCoupons;
      }
    } catch (e) {
      debugPrint('FilterCouponsError: $e');
      emit(FilterCouponsError(e.toString()));
      return [];
    }
  }

// List<CouponModel> coupons = [];
// Future<Object> filterCoupons( ) async{
//   emit(FilterCouponsLoading());
//   try {
//     if (dropDownValue == 'All') {
//       emit(FilterCouponsSuccess(coupons));
//       return await storeCouponsRepository.getStoreCoupons();
//       // return coupons
//       //     .where((element) => selectedCategories.contains(element.categoryId))
//       //     .toList();
//     } else if (dropDownValue == 'Coupons') {
//       debugPrint('FilterCouponsSuccess: $coupons');
//       emit(FilterCouponsSuccess(coupons));
//       return coupons.where((element) {
//         return element.ctype == '1' &&
//             selectedCategories.contains(element.categoryId);
//       }).toList();
//     } else {
//       emit(FilterCouponsSuccess(coupons));
//       return coupons.where((element) {
//         return element.ctype == '3' &&
//             selectedCategories.contains(element.categoryId);
//       }).toList();
//     }
//   } catch (e) {
//     debugPrint('FilterCouponsError: $e');
//     emit(FilterCouponsError(e.toString()));
//     return [];
//   }
// }
}
