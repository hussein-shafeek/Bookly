import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String? bookId;
  final String? image;
  final String? title;
  final String? authorName;
  final num? price;
  final num? rating;
  final int? ratingsCount;
  final String? previewLink;
  final List<String>? categories;

  const BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.bookId,
    this.ratingsCount,
    this.previewLink,
    this.categories,
  });

  @override
  List<Object?> get props => [
    bookId,
    image,
    title,
    authorName,
    price,
    rating,
    ratingsCount,
    previewLink,
    categories,
  ];
}
