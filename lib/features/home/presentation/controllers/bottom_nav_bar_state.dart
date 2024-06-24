part of 'bottom_nav_bar_cubit.dart';

@immutable
sealed class BottomNavBarState {}

final class BottomNavBarInitial extends BottomNavBarState {}

final class BottomNavBarSelected extends BottomNavBarState {
  final int index;

  BottomNavBarSelected(this.index);
}