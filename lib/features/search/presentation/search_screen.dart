import 'package:flutter/material.dart';
import 'package:gc_coupons/features/search/presentation/widgets/search_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchTextFormField(),
        ],
      ),
    );
  }
}
