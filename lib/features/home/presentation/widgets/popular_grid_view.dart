import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/home/presentation/controllers/popular_stores_cubit/popular_stores_cubit.dart';

import 'grid_item.dart';

class PopularGridView extends StatelessWidget {
  const PopularGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularStoresCubit>(
      create: (_) => sl<PopularStoresCubit>()..getPopularStores(),
      child: BlocBuilder<PopularStoresCubit, PopularStoresState>(
        builder: (context, state) {
          if (state is PopularStoresLoaded) {
            return SizedBox(
              height: 200.h,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                padding: EdgeInsets.only(left: 5.w,bottom: 5.h),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  state.stores.length,
                  (index) {
                    return GridItem(
                      imageUrl: state.stores[index].storeImage,
                      onTap: () {},
                    );
                  },
                ),
              ),
            );
          } else {
            ///Todo : Needed to Handel
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
