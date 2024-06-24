import 'package:flutter/material.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFancyShimmerImage(
      imageUrl:
      "https://kidlingoo.com/wp-content/uploads/flowers_name_in_english.jpg",
      onTap: () {},
    );
  }
}
