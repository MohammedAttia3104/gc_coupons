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