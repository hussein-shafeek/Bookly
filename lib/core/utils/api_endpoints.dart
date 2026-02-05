class ApiEndPoints {
  // Base URL
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  // API Key
  static const String apiKey = 'AIzaSyBshRboYbRm_5BzYJxEaQp3J4Mxqewpt6E';

  // Featured Books
  static String featuredBooks({String subject = 'Programming'}) =>
      'volumes?Filtering=free-ebooks&q=subject:$subject&key=$apiKey';

  // Newest Books
  static String newestBooks({String query = 'computer science'}) =>
      'volumes?Filtering=free-ebooks&Sorting=newest&q=$query&key=$apiKey';

  // Similar Books
  static String similarBooks({String category = 'Programming'}) =>
      'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category&key=$apiKey';

  // Search Books
  static String searchBooks({required String query}) =>
      'volumes?Filtering=free-ebooks&q=$query&key=$apiKey';
}
