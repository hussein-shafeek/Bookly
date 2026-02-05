import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/smila_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/home_view';
  static const kBookDetailsView = '/book_details_view';
  static const kSearchView = '/search_view';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SearchBooksCubit>(),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<FeaturedBooksCubit>(
                create: (context) =>
                    getIt<FeaturedBooksCubit>()..fetchFeaturedBooks(),
              ),
              BlocProvider<NewsetBooksCubit>(
                create: (context) =>
                    getIt<NewsetBooksCubit>()..fetchNewestBooks(),
              ),
            ],

            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<SimilarBooksCubit>(),

            child: BookDetailsView(book: state.extra as BookModel),
          );
        },
      ),
    ],
  );
}
