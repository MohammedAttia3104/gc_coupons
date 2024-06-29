import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_coupons/core/services/service_locator.dart';
import 'package:gc_coupons/features/search/presentation/controllers/search_cubit.dart';
import 'package:gc_coupons/features/search/presentation/widgets/search_item.dart';
import 'package:gc_coupons/features/search/presentation/widgets/search_text_form_field.dart';

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
    return BlocProvider<SearchCubit>(
      create: (_) =>
          sl<SearchCubit>()..getSearchData(searchQuery: searchController.text),
      child: Scaffold(
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            var searchCubit = SearchCubit.of(context);
            if (state is SearchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchTextFormField(
                      onChanged: (value) {
                        searchCubit.getSearchData(searchQuery: value);
                      },
                      searchController: searchController,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.storeData.length,
                      itemBuilder: (context, index) {
                        return SearchItem(
                          storeDataModel: state.storeData[index],
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('Search for a store'),
            );
          },
        ),
      ),
    );
  }
}
