import 'package:bookly/core/shimmer/shimmer_container_effect.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class ShimmerFeaturedListView extends StatelessWidget {
  const ShimmerFeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, s) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: ShimmerContainerEffect(borderRadius: 16),
        ),
      ),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .32,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
        aspectRatio: 2.0,
        initialPage: 0,
      ),
    );
  }
}
