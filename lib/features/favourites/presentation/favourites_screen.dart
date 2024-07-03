import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/size_config.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/search_container.dart';
import 'package:gc_coupons/features/favourites/presentation/controllers/favourites_cubit.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
        child: Column(
          children: [
            SizedBox(height: AppPadding.padding14h),
            const SearchContainer(),
            SizedBox(height: AppPadding.padding14h),
            Expanded(
              child: BlocBuilder<FavouritesCubit, FavouritesState>(
                builder: (context, state) {
                  if (state is FavouritesLoaded) {
                    return state.store.isNotEmpty
                        ? ListView.separated(
                            itemCount: state.store.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 70.h,
                                decoration: BoxDecoration(
                                  color: AppColors.offWhiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 5.h,
                                  ),
                                  title: Text(
                                    state.store[index].storeName ?? '',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.ticketAlt,
                                        size: 16.r,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        '${state.store[index].storeId.toString()} Coupons',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 24.r,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<FavouritesCubit>(context)
                                          .removeFavourite(
                                        state.store[index],
                                      );
                                    },
                                  ),
                                  leading: CustomFancyShimmerImage(
                                    imageUrl:
                                        state.store[index].storeImage ?? '',
                                    height: 60.h,
                                    width: 60.w,
                                    radius: 10.r,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 10.h);
                            },
                          )
                        : const Center(
                            child: Text('No favourites added yet'),
                          );
                  } else {
                    return const Center(
                      child: Text('Nooooooooo'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
