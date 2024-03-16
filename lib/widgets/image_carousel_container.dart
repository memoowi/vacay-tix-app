import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class ImageCarouselContainer extends StatelessWidget {
  final String imageUrl;
  const ImageCarouselContainer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      width: double.infinity,
      imageUrl: imageUrl,
      boxFit: BoxFit.cover,
      shimmerBaseColor: CustomColors.chestnut,
      shimmerHighlightColor: CustomColors.eggshell,
      errorWidget: Image.asset(
        'assets/images/image-404.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}