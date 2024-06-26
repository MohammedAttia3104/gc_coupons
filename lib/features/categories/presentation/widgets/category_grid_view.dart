import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/features/categories/presentation/controllers/category_cubit.dart';
import 'package:gc_coupons/features/categories/presentation/widgets/category_single_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoryLoaded) {
          return GridView.builder(
            padding: EdgeInsets.all(14.h),
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // childAspectRatio: 1.5,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              mainAxisExtent: 110.r,
            ),
            itemBuilder: (context, index) {
              return CategorySingleItem(model: state.categories[index]);
            },
            itemCount: state.categories.length,
          );
        }else{
          return Container();
        }
      },
    );
  }
}
