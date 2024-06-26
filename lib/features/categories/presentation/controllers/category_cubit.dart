import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gc_coupons/features/categories/data/respository/category_repository.dart';
import 'package:gc_coupons/features/categories/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  void getCategories() async {
    emit(CategoryLoading());
    final result = await categoryRepository.getCategories();
    result.fold(
      (error) {
        print('Error: ${error.message}');
        emit(CategoryError(error.message));
      },
      (categories) {
        print('Categories: $categories');
        emit(CategoryLoaded(categories));
      },
    );
  }
}
