import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_models/smila_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.books.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 2.7 / 4,
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        'https://images.pexels.com/photos/46274/pexels-photo-46274.jpeg',
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(error: state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
