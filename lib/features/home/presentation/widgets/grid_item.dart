import 'package:flutter/material.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';

class GridItem extends StatelessWidget {
  final String imageUrl;
  final Function() onTap;

  const GridItem({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomFancyShimmerImage(
      imageUrl: imageUrl,
      onTap: onTap,
    );
  }
}
