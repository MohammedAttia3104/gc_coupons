import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/utils/bottom_nav_bar_model.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  //object from bloc
  static BottomNavBarCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  List<BottomNavBarModel> items = [
    BottomNavBarModel(
      title: AppStrings.home,
      icon: Icons.home,
      backgroundColor: Colors.blue[200],
      selectedIconColor: Colors.blue,
    ),
    BottomNavBarModel(
      title: AppStrings.allStores,
      icon: FontAwesomeIcons.store,
      backgroundColor: Colors.orange[200],
      selectedIconColor: Colors.orange,
    ),
    BottomNavBarModel(
      title: AppStrings.favourites,
      icon: FontAwesomeIcons.heart,
      backgroundColor: Colors.red[200],
      selectedIconColor: Colors.red,
    ),
  ];

  void updateIndex(int index) {
    selectedIndex = index;
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    emit(BottomNavBarSelected(index));
  }
}
