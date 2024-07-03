import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/features/favourites/presentation/controllers/favourites_cubit.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';

class FavouriteStoreIconWidget extends StatelessWidget {
  const FavouriteStoreIconWidget({
    super.key,
    required this.storeModel,
  });

  final StoreDataModel storeModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        // Access the FavouritesCubit from the context
        final cubit = FavouritesCubit.get(context);
        // Determine if the current storeModel is in the list of favorites
        bool isFavourite = cubit.favourites
            .any((store) => store.storeId == storeModel.storeId);

        return IconButton(
          onPressed: () {
            cubit.toggleFavourite(storeModel);
            // cubit.changeFavouriteIconColor();
          },
          icon: Icon(
            Icons.favorite,
            color: isFavourite ? Colors.red : Colors.black,
            size: 24.r,
          ),
        );
      },
    );
  }
}
