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

  //filter list of coupons according to dropDown value [All, Coupons, Deals] and also  category chose from filterChip
  List<CouponModel> filterCoupons({
    required List<CouponModel> coupons,
    required String dropDownValue,
    required List<String> selectedCategories,
  }) {
    emit(FilterCouponsLoading());
    try {
      if (dropDownValue == 'All') {
        emit(FilterCoupons(coupons));
        return coupons
            .where((element) => selectedCategories.contains(element.categoryId))
            .toList();
      } else if (dropDownValue == 'Coupons') {
        emit(FilterCoupons(coupons));
        return coupons.where((element) {
          return element.ctype == '1' &&
              selectedCategories.contains(element.categoryId);
        }).toList();
      } else {
        emit(FilterCoupons(coupons));
        return coupons.where((element) {
          return element.ctype == '3' &&
              selectedCategories.contains(element.categoryId);
        }).toList();
      }
    } catch (e) {
      debugPrint('FilterCouponsError: $e');
      emit(FilterCouponsError(e.toString()));
      return [];
    }
  }

  //selected value of drop down button
  String selectedValue = 'All';
  List<String> dropDownValues = ['All', 'Coupons', 'Deals'];

  //change value of drop down button and return current value
  //update DropDown value
  void changeDropDownValue(String value) {
    selectedValue = value;
    emit(ChangeDropDownValue(value));
  }


  List<String> selectedCategories = [];

  void selectCategory(CategoryModel category) {
    selectedCategories.add(category.id);
    emit(SelectCategory(selectedCategories));
  }

  void deselectCategory(CategoryModel category) {
    selectedCategories.remove(category.id);
    emit(DeselectCategory(selectedCategories));
  }
}
