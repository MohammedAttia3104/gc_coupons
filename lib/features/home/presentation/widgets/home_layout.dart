import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/features/home/presentation/controllers/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        BottomNavBarCubit cubit = BottomNavBarCubit.get(context);
        return StylishBottomBar(
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            bubbleFillStyle: BubbleFillStyle.fill,
            opacity: 0.8,
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
              left: 10.w,
              right: 10.w,
            ),
          ),
          //iconSpace: 10,
          elevation: 2.0,
          items: List.generate(
            cubit.items.length,
            (index) {
              return BottomBarItem(
                icon: Icon(
                  cubit.items[index].icon,
                  color: cubit.items[index].notSelectedIconColor,
                ),
                title: FittedBox(
                  child: Text(
                    cubit.items[index].title,
                    //textAlign: TextAlign.start,
                    style: TextStyle(
                      color: cubit.items[index].selectedIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                backgroundColor: cubit.items[index].backgroundColor,
                selectedIcon: Icon(
                  cubit.items[index].icon,
                  color: cubit.items[index].selectedIconColor,
                ),
              );
            },

          ),
          currentIndex: cubit.selectedIndex,
          onTap: cubit.updateIndex,
        );
      },
    );
  }
}
