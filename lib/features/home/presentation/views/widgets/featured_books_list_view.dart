import 'package:bookly/core/routes/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/shimmer/shimmer_featured_list_view.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carousel_slider/carousel_slider.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return CarouselSlider.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].image ??
                          "https://images.pexels.com/photos/46274/pexels-photo-46274.jpeg",
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .32,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                aspectRatio: 2.0,
                initialPage: 0,
              ),
            );
          } else if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(error: state.errMessage);
          } else {
            return const ShimmerFeaturedListView();
          }
        },
      ),
    );
  }
}
