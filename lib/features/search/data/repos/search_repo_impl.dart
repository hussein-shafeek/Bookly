import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_endpoints.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: ApiEndPoints.searchBooks(query: category),
      );

      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(dioException: e));
      }
      return left(ServerFailure.fromResponse(response: e.toString()));
    }
  }
}
