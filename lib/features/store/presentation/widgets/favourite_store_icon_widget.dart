import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/utils/constants.dart';
import 'package:gc_coupons/features/favourites/presentation/controllers/favourites_cubit.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:hive/hive.dart';

class FavouriteStoreIconWidget extends StatefulWidget {
  const FavouriteStoreIconWidget({
    super.key,
    required this.storeModel,
  });

  final StoreDataModel storeModel;

  @override
  State<FavouriteStoreIconWidget> createState() =>
      _FavouriteStoreIconWidgetState();
}

class _FavouriteStoreIconWidgetState extends State<FavouriteStoreIconWidget> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    _updateFavouriteStatus();
  }

  void _updateFavouriteStatus() {
    final box = Hive.box<StoreDataModel>(kStoreBox);
    isFavourite = box.containsKey(widget.storeModel.storeId);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        FavouritesCubit.get(context).toggleFavourite(widget.storeModel);
        if (isFavourite) {
          await Hive.box<StoreDataModel>(kStoreBox)
              .delete(widget.storeModel.storeId);
        } else {
          await Hive.box<StoreDataModel>(kStoreBox)
              .put(widget.storeModel.storeId, widget.storeModel);
        }
        setState(() {
          _updateFavouriteStatus();
        });
      },
      icon: Icon(
        Icons.favorite,
        color: isFavourite ? Colors.red : Colors.black,
        size: 24.r,
      ),
    );
  }
}
