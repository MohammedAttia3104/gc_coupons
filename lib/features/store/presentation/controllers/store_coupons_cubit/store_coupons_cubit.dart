import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/features/store/data/repository/store_coupon_repository.dart';
import 'package:meta/meta.dart';

part 'store_coupons_state.dart';

class StoreCouponsCubit extends Cubit<StoreCouponsState> {
  StoreCouponsRepository storeCouponsRepository;

  StoreCouponsCubit(this.storeCouponsRepository) : super(StoreCouponsInitial());

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
}
