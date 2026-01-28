import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl:
                "https://images.pexels.com/photos/46274/pexels-photo-46274.jpeg",
          ),
        ),
        const SizedBox(height: 43),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          rating: 4,
          count: 100,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(),
      ],
    );
  }
}
