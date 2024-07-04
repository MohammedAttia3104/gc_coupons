import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';

class StoreCustomDropDown extends StatelessWidget {
  final StoreDataModel storeDataModel;

  const StoreCustomDropDown({
    super.key,
    required this.storeDataModel,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<StoreCouponsCubit>();
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        style: AppStyles.style14Bold.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        dropdownColor: Colors.white,
        value: cubit.dropDownValue,
        //alignment: Alignment.center
        items: List.generate(cubit.dropDownValues.length, (index) {
          return DropdownMenuItem(
            alignment: Alignment.center,
            value: cubit.dropDownValues[index],
            child: Text(cubit.dropDownValues[index]),
          );
        }),
        onChanged: (value) {
          cubit.changeDropDownValue(value!);
          cubit.filterCoupons(storeDataModel.storeId);
        },
        onTap: () {
          cubit.changeDropDownValue(cubit.dropDownValue);
          debugPrint('Tapped on dropdown');
        },
        borderRadius: BorderRadius.circular(10).r,
      ),
    );
  }
}
