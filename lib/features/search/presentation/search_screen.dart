import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/search/presentation/controllers/search_cubit.dart';
import 'package:gc_coupons/features/search/presentation/widgets/is_empty_search_widget.dart';
import 'package:gc_coupons/features/search/presentation/widgets/search_item.dart';
import 'package:gc_coupons/features/search/presentation/widgets/search_text_form_field.dart';

import '../../../core/shimmer/search_shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

late TextEditingController searchController;

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<SearchCubit>()..getSearchData(searchQuery: searchController.text),
      child: Scaffold(
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            var searchCubit = SearchCubit.of(context);
            // if (state is SearchLoading) {
            //   return const SearchShimmer();
            // } else
            if (state is SearchSuccess) {
              return Column(
                children: [
                  SearchTextFormField(
                    onChanged: (value) {
                      if (value!.isNotEmpty) {
                        searchCubit.getSearchData(searchQuery: value);
                      }
                    },
                    searchController: searchController,
                  ),
                  searchController.text.isEmpty
                      ? const IsEmptySearchWidget()
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: state.storeData.length,
                            itemBuilder: (context, index) {
                              return SearchItem(
                                storeDataModel: state.storeData[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                        ),
                ],
              );
            } else if (state is NoMatchedStoresFound) {
              return Column(
                children: [
                  SearchTextFormField(
                    onChanged: (value) {
                      if (value!.isNotEmpty) {
                        searchCubit.getSearchData(searchQuery: value);
                      }
                    },
                    searchController: searchController,
                  ),
                  SizedBox(
                    height: 350.h,
                    child: Center(
                      child: Text(
                        'No Stores Found.\nPlease Try Again!',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is SearchError) {
              debugPrint('SearchError: ${state.message}');
              return Column(
                children: [
                  SearchTextFormField(
                    onChanged: (value) {
                      if (value!.isNotEmpty) {
                        searchCubit.getSearchData(searchQuery: value);
                      }
                    },
                    searchController: searchController,
                  ),
                  SizedBox(
                    height: 350.h,
                    child: Center(
                      child: Text(
                        'No Stores Found.\nPlease Try Again!',
                        style: AppStyles.style18Bold,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  SearchTextFormField(
                    onChanged: (value) {
                      if (value!.isNotEmpty) {
                        searchCubit.getSearchData(searchQuery: value);
                      }
                    },
                    searchController: searchController,
                  ),
                  searchController.text.isEmpty
                      ? const IsEmptySearchWidget()
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: 0,
                            itemBuilder: (context, index) {
                              return SearchItem(
                                storeDataModel: searchCubit.storeData[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                        ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
