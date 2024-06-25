part of 'trending_coupons_cubit.dart';

@immutable
sealed class TrendingCouponsState {}

final class TrendingCouponsInitial extends TrendingCouponsState {}

final class TrendingCouponsLoading extends TrendingCouponsState {}

final class TrendingCouponsLoaded extends TrendingCouponsState {
  final List<TrendingCouponsModel> trendingCoupons;

  TrendingCouponsLoaded(this.trendingCoupons);
}

final class TrendingCouponsError extends TrendingCouponsState {
  final String message;

  TrendingCouponsError(this.message);
}
