import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatefulWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BooksAction> createState() => _BooksActionState();
}

class _BooksActionState extends State<BooksAction> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              isLoading: isLoading,
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                await launchCustomUrl(
                  context,
                  widget.bookModel.volumeInfo.previewLink,
                );

                await Future.delayed(const Duration(milliseconds: 500));

                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              fontSize: 16,
              text: getText(widget.bookModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
