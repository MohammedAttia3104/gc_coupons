import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/widgets/search_container.dart';
import 'package:gc_coupons/features/favourites/presentation/controllers/favourites_cubit.dart';

import '../../../core/constants/size_config.dart';

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
            BlocBuilder<FavouritesCubit, FavouritesState>(
              builder: (context, state) {
                if (state is FavouritesLoaded) {
                  return ListView.builder(
                    itemCount: state.store.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.store[index].storeName ?? ''),
                        subtitle: Text(state.store[index].storeId.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            BlocProvider.of<FavouritesCubit>(context)
                                .removeFavourite(state.store[index]);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Nooooooooo'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
