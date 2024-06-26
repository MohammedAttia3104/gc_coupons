import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/features/home/data/repositories/trending_coupons_repository.dart';
import 'package:gc_coupons/features/home/models/trending_model.dart';

part 'trending_coupons_state.dart';

class TrendingCouponsCubit extends Cubit<TrendingCouponsState> {
  TrendingCouponsRepository trendingCouponsRepository;

  TrendingCouponsCubit(this.trendingCouponsRepository)
      : super(TrendingCouponsInitial());

  static TrendingCouponsCubit get(context) => BlocProvider.of(context);

  List<TrendingCouponsModel>? trendingCoupons;

  void getTrendingCoupons() async {
    emit(TrendingCouponsLoading());
    final result = await trendingCouponsRepository.getTrendingCoupons();
    result.fold(
      (error) {
        emit(TrendingCouponsError(error.message));
      },
      (trendingCoupons) {
        emit(TrendingCouponsLoaded(trendingCoupons));
      },
    );
  }
}
