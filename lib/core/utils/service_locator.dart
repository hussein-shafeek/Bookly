import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/data/repository/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/smila_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/search/domain/repos/search_repo.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Dio
  getIt.registerSingleton<Dio>(Dio());
  //ApiService
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  //HomeRepo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt.get<ApiService>()),
  );

  //featured books cubit
  getIt.registerFactory<FeaturedBooksCubit>(
    () => FeaturedBooksCubit(getIt.get<HomeRepo>()),
  );
  //newest books cubit
  getIt.registerFactory<NewsetBooksCubit>(
    () => NewsetBooksCubit(getIt.get<HomeRepo>()),
  );
  //similar books cubit

  getIt.registerFactory<SimilarBooksCubit>(
    () => SimilarBooksCubit(getIt.get<HomeRepo>()),
  );

  //SearchRepo
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(getIt.get<ApiService>()),
  );

  //search books cubit
  getIt.registerFactory<SearchBooksCubit>(
    () => SearchBooksCubit(getIt.get<SearchRepo>()),
  );
}

// import 'package:bookly_app/core/api/api_services_implementation.dart';
// import 'package:bookly_app/features/home/data/repository/home_repository_implementation.dart';
// import 'package:bookly_app/features/search/data/repository/search_repository_implementation.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// void setupServiceLocator() {
//   getIt.registerSingleton<ApiServicesImplementation>(
//       ApiServicesImplementation());
//   getIt.registerSingleton<HomeRepositoryImplementation>(
//       HomeRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
//   getIt.registerSingleton<SearchRepositoryImplementation>(
//       SearchRepositoryImplementation(getIt.get<ApiServicesImplementation>()));
// }
