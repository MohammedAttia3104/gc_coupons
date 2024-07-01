import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/features/categories/data/respository/category_repository.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  //object of cubit
  static CategoryCubit of(BuildContext context) =>
      BlocProvider.of<CategoryCubit>(context);

  void getCategories() async {
    emit(CategoryLoading());
    final result = await categoryRepository.getCategories();
    result.fold(
      (error) => emit(CategoryError(error.message)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }


}
