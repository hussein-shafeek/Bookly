import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          child: AspectRatio(aspectRatio: 2.7 / 4, child: CustomBookImage()),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
      ),
    );
  }
}
