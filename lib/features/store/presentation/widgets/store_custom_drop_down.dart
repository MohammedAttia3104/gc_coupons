import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_coupons_cubit/store_coupons_cubit.dart';
import 'package:gc_coupons/features/store/presentation/controllers/store_data_cubit/store_cubit.dart';

class StoreCustomDropDown extends StatelessWidget {
  const StoreCustomDropDown({
    super.key,
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
        value: cubit.selectedValue,
        //alignment: Alignment.center
        items: List.generate(
            cubit.dropDownValues.length,
            (index) {
              return DropdownMenuItem(
                  alignment: Alignment.center,
                  value: cubit.dropDownValues[index],
                  child: Text(cubit.dropDownValues[index]),
                );
            }),
        onChanged: (value) {
          cubit.changeDropDownValue(value!);
        },
        onTap: () {
          cubit.changeDropDownValue(cubit.selectedValue);
          debugPrint('Tapped on dropdown');
        },
        borderRadius: BorderRadius.circular(10).r,
      ),
    );
  }
}
