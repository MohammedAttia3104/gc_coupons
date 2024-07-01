import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/features/favourites/presentation/controllers/favourites_cubit.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:gc_coupons/generated/assets.dart';

class StoreBar extends StatelessWidget {
  final StoreDataModel storeModel;

  const StoreBar({
    super.key,
    required this.storeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.only(top: 35.h),
        width: MediaQuery.sizeOf(context).width,
        //height: 35.h,
        decoration: const BoxDecoration(
          color: AppColors.kWhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_sharp),
            ),
            Expanded(
              child: Text(
                storeModel.storeName ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
            // const Spacer(),
            //trailing
            BlocBuilder<FavouritesCubit, FavouritesState>(
              builder: (context, state) {
                if (state is FavouritesLoaded) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<FavouritesCubit>(context)
                          .addFavourite(storeModel);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color:
                          BlocProvider.of<FavouritesCubit>(context).isFavourite
                              ? Colors.red
                              : AppColors.kBlackColor,
                      size: 24.r,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Nooooooooo'),
                  );
                }
              },
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.assetsIconsShareNodesSolid,
                fit: BoxFit.contain,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
